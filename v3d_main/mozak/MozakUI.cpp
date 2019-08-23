#include "MozakUI.h"
#include "Mozak3DView.h"
#include "v3d_application.h"
// 20170624 RZC: central control include files in Mozak3DView.h
//#include "../terafly/src/control/CViewer.h"
#include <boost/bind.hpp>
#include  "math.h"
#include "dsl/dslLogging.h"
#include "dsl/dslLogger.h"
#include "dsl/dslMathUtils.h"

using dsl::getHighestLogLevel;
using dsl::Logger;

using namespace mozak;
using namespace ai;
using dsl::uint;
using dsl::lInfo;


void MozakUI::init(V3d_PluginLoader *pl)
{
	createInstance(pl, 0);
}

MozakUI::~MozakUI()
{
    V3dApplication::activateMainWindow();
}

MozakUI::MozakUI(V3DPluginCallback2 *callback, QWidget *parent)
	:
	teramanager::PMain(callback, parent),	
	mLastPOV(ai::povNotEngaged),
	mGC(unique_ptr<ai::GameControllerRaw>(new ai::GameControllerRaw()))
{
	dsl::gLogger.setLogLevel(dsl::lDebug3);
	mMozak3DView = NULL;
	
	mWindowsHandle = this->winId();

	if (mGC)
	{
		mGC->capture(mWindowsHandle);
		mGC->enable();
		mGC->mPOV.assignEvent(bind(&MozakUI::onPOV, this, _1));
		mGC->mJoyStick1.mXAxis.assignEvent(bind(&MozakUI::onAxis, this, _1 ));
		mGC->mJoyStick1.mYAxis.assignEvent(bind(&MozakUI::onAxis, this, _1 ));

		mGC->mJoyStick2.mXAxis.assignEvent(bind(&MozakUI::onAxis, this, _1));
		mGC->mJoyStick2.mYAxis.assignEvent(bind(&MozakUI::onAxis, this, _1));

		mGC->mFrontLeftAxis.assignEvent(bind(&MozakUI::onAxis, this, _1));
		mGC->mFrontRightAxis.assignEvent(bind(&MozakUI::onAxis, this, _1));
		

        mGC->mButton5.assignButtonEvents(bind(&MozakUI::onButtonDown, this, _1), NULL);
		mGC->mButton6.assignButtonEvents(bind(&MozakUI::onButtonDown, this, _1), NULL);
		mGC->mButton7.assignButtonEvents(bind(&MozakUI::onButtonDown, this, _1), NULL);
		mGC->mButton8.assignButtonEvents(bind(&MozakUI::onButtonDown, this, _1), NULL);
		mGC->mButton9.assignButtonEvents(bind(&MozakUI::onButtonDown, this, _1), NULL);

	}
	// This inherits from the PMain constructor ( teramanager::PMain(callback, parent) )
	// so that constructor will be called before the following code:

	// Adjust Terafly UI
	//setWindowTitle(QString("Neuron Game UI"));
}

void MozakUI::createInstance(V3DPluginCallback2 *callback, QWidget *parent)
{
    if (uniqueInstance == 0)
        uniqueInstance = new MozakUI(callback, parent);
    uniqueInstance->reset();
    uniqueInstance->show();

#ifdef MOZAK_AUTOLOAD_VOLUME_PATH
	string path = MOZAK_AUTOLOAD_VOLUME_PATH;
    QFileInfo pathinfo(path.c_str());
    if(path.c_str().isEmpty() || !QFile::exists(path.c_str()))
	    uniqueInstance->openTeraFlyVolume(""); // this will prompt for user to find path
    else if(pathinfo.isDir())
        uniqueInstance->openTeraFlyVolume(path);
    else if(pathinfo.isFile())
        uniqueInstance->openHDF5Volume(path);
    }
#else
	uniqueInstance->openTeraFlyVolume(""); // this will prompt for user to find path
#endif
#ifdef MOZAK_HIDE_VAA3D_CONTROLS
	uniqueInstance->hide();
	//V3dApplication::deactivateMainWindow();
#endif
	
}

bool MozakUI::winEvent(MSG * message, long * result)
{ 
	if (message->message == WM_INPUT)
	{
		if (mGC && mGC->isEnabled())
		{
            //This may trigger callbacks
			mGC->processRawInput(message->lParam);
		}
	}
	return false;
}

void MozakUI::onAxis(JoyStickAxis* axis)
{		
	if (axis == &mGC->mJoyStick2.mXAxis || axis == &mGC->mJoyStick2.mYAxis)
	{
		Log(lInfo) << "Joystick 2 axes";
	}

	if (axis == &mGC->mFrontLeftAxis || axis == &mGC->mFrontRightAxis)
	{
        int pos(mGC->mFrontLeftAxis.getPosition() - 32768);
        
        Log(dsl::lDebug) << "Front axes" << pos;
        static int count(0);    
        if (count % 10000)
        {
            if (pos > 0)
                this->zoomIn();
            else
                this->zoomOut();
            
        }
        count++;
	}

	if (axis == &mGC->mJoyStick2.mXAxis || axis == &mGC->mJoyStick2.mYAxis && mLastPOV)// != povSouth)
	{
		int x = (mGC->mJoyStick2.mXAxis.getPosition() - 32768) ;
		int y = (mGC->mJoyStick2.mYAxis.getPosition() - 32768) * -1;

		double magnitude = sqrt(pow(x, 2) + pow(y, 2));

		if ((double) (magnitude/32768) > 0.85)		
		{
			double theta = dsl::toDegree( std::atan2(y, x)); 
			theta = fmod(theta + 270, 360);
			Log(lInfo) << "(x,y) -> (" << x << "," << y << ")\t" << "Theta: " << theta << "\tMagn" << magnitude << "POV: " << mGC->mPOV.getState();

			//QSpinBox *xRotBox, *yRotBox, *zRotBox, *zoomBox, *xShiftBox, *yShiftBox;

			
			if (mLastPOV == povWest )
			{				
				mMozak3DView->window3D->xRotBox->setValue(theta);											
			}
			else if (mLastPOV == povNorth)
			{
				mMozak3DView->window3D->yRotBox->setValue(theta);
			}

			else if (mLastPOV == povEast)
			{
				mMozak3DView->window3D->zRotBox->setValue(theta);
			}
			else
			{
				QPoint p = mMozak3DView->view3DWidget->mapFromGlobal(QCursor::pos());
				QMouseEvent eve(QEvent::MouseButtonDblClick, p, Qt::RightButton, Qt::NoButton, Qt::NoModifier);
				mMozak3DView->eventFilter(mMozak3DView->view3DWidget, &eve);
			}
		}		
	}
}

void MozakUI::onPOV(ai::GameControllerPOV* p)
{	
	Log(dsl::lDebug) << "POV state: " << p->getStateAsString() << "\t" << p->getState() << "\t" << p->getHWState();
	if (p->getState() == povNotEngaged)
	{
		Log(dsl::lDebug) << "POV is not engaged anymore";
	}
	else
	{
		mLastPOV = p->getState();
	}	
}

void MozakUI::onButtonDown(ai::GameControllerButton* btn)
{
    if (!btn)
    {
        return;
    }
    else
    {
        Log(dsl::lDebug) << "Button: " << btn->getLabel() << " is down";
    }

	//Zoom in/out the scale (center on current cursor position)
	if (btn == &mGC->mButton5 || btn == &mGC->mButton6)
	{
		QPoint p = mMozak3DView->view3DWidget->mapFromGlobal(QCursor::pos());
		
        //send a Mouse double click on left or right button		
		QMouseEvent eve(QEvent::MouseButtonDblClick, p, (btn == &mGC->mButton6 ? Qt::LeftButton : Qt::RightButton), Qt::NoButton, Qt::NoModifier);
		mMozak3DView->eventFilter(mMozak3DView->view3DWidget, &eve);		
	}	
}

void MozakUI::zoomIn(void)
{	
	if (mMozak3DView)
	{
		do
		{
			Renderer_gl2* curr_renderer = (Renderer_gl2*)(mMozak3DView->view3DWidget->getRenderer());
			int prevZoom = mMozak3DView->view3DWidget->zoom();

			int zoomStep = -1;//MOUSE_ZOOM(d);
			Log(dsl::lInfo) << "Zoom Step: " << zoomStep;
			int newZoom = zoomStep + prevZoom; // wheeling up should zoom IN, not out

			// Change zoom
			mMozak3DView->view3DWidget->setZoom(newZoom);
			curr_renderer->paint(); // updates the projection matrix			
			QApplication::processEvents();
		} while (mGC->mButton8.isDown());
	}
}

void MozakUI::zoomOut(void)
{	
	Renderer_gl2* curr_renderer = (Renderer_gl2*)(mMozak3DView->view3DWidget->getRenderer());
	Renderer::SelectMode currentMode = curr_renderer->selectMode;

	if (mMozak3DView)
	{
		do
		{
			int prevZoom = mMozak3DView->view3DWidget->zoom();
			int zoomStep = 1;// MOUSE_ZOOM(d);
			int newZoom = zoomStep + prevZoom; // wheeling up should zoom IN, not out

			// Change zoom
			mMozak3DView->view3DWidget->setZoom(newZoom);
			curr_renderer->paint(); // updates the projection matrix			
			QApplication::processEvents();
		} while (mGC->mButton7.isDown());
	}
}

MozakUI* MozakUI::getMozakInstance()
{
	return static_cast<MozakUI*>(uniqueInstance);
}

void MozakUI::reset()
{}

teramanager::CViewer * MozakUI::initViewer(V3DPluginCallback2* _V3D_env, int _resIndex, itm::uint8* _imgData, int _volV0, int _volV1,
	int _volH0, int _volH1, int _volD0, int _volD1, int _volT0, int _volT1, int _nchannels, itm::CViewer* _prev)
{
	mMozak3DView = new Mozak3DView(_V3D_env, _resIndex, _imgData, _volV0, _volV1, _volH0, _volH1, _volD0, _volD1, _volT0, _volT1, _nchannels, _prev, -1);

	teramanager::CViewer* new_win = mMozak3DView;			
	return new_win;
}


//20170803 RZC
void MozakUI::onImageTraceHistoryChanged()
{
	Mozak3DView* mozak_view = (Mozak3DView*)( teramanager::CViewer::getCurrent() );
	if (! mozak_view) return;

	mozak_view->onNeuronEdit();
}

