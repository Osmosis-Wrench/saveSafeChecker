import gfx.io.GameDelegate;
import gfx.managers.FocusHandler;
import gfx.ui.InputDetails;
import gfx.ui.NavigationCode;
import Shared.GlobalFunc;
import Components.Meter;
import skyui.util.Tween;
import mx.utils.Delegate;
import skse;
import JSON;

class wabbaMessage extends MovieClip
{
	var modListName: TextField;
	var modListMessage: TextField;
	var cancelRect: MovieClip;
	var acceptRect: MovieClip;
	var otherOption: MovieClip;
	var defaultOption: MovieClip;
	var currentSelection: Boolean = true;
	var moving: Boolean = false;
	var acceptTextBox: TextField;
	var cancelTextBox: TextField;
	
	function wabbaMessage()
	{
		super();
		this._visible = false;
		
		FocusHandler.instance.setFocus(this,0);
		
		acceptRect.onRollOver = function()
		{
			_parent.highlightAccept();
		};
		acceptRect.onRollOut = function()
		{
			_parent.unHighlightAccept();
		};
		acceptRect.onMouseDown = function()
		{
			if (Mouse.getTopMostEntity() == this)
			{
				_parent.doAccept();
			}
		};
		cancelRect.onRollOver = function()
		{
			_parent.highlightCancel();
		};
		cancelRect.onRollOut = function()
		{
			_parent.unHighlightCancel();
		};
		cancelRect.onMouseDown = function()
		{
			if (Mouse.getTopMostEntity() == this)
			{
				_parent.doCancel();
			}
		};
	}
	
	private function onLoad(): Void
	{
		this._visible = false;
		//setText("My Modlist Name", "You have attempted to load a save made for an older or incompatible version of this modlist.", "poop", "ass");
	}
	
	public function setText(modlistNameArg:String, modlistMessageArg:String, cancelText:String, acceptText:String): Void
	{
		modListName.text = modlistNameArg;
		modListMessage.text = modlistMessageArg;
		cancelTextBox.text = cancelText;
		acceptTextBox.text = acceptText;
		this._visible = true;
	}
	
	function handleInput(details: InputDetails, pathToFocus: Array): Void
	{
		//testText.text = details.toString();
		if (!moving && GlobalFunc.IsKeyPressed(details)){
			if (details.navEquivalent == NavigationCode.LEFT)
			{
				currentSelection = false;
				highlightCancel();
				unHighlightAccept();
			}
			else if (details.navEquivalent == NavigationCode.RIGHT)
			{
				currentSelection = true;
				highlightAccept();
				unHighlightCancel();
			}
			else if (details.navEquivalent == NavigationCode.GAMEPAD_B || details.navEquivalent == NavigationCode.TAB || details.navEquivalent == NavigationCode.GAMEPAD_BACK)
			{
				doAccept();
			}
			else if (details.navEquivalent == NavigationCode.GAMEPAD_A || details.navEquivalent == NavigationCode.ENTER)
			{
				currentSelection ? doAccept() : doCancel();
			}
		}
	}
	
	private function doAccept(): Void
	{
		if (!moving)
		{
			moving = true;
			var onCompleteMove:Function = Delegate.create(this, function ()
			{
			skse.SendModEvent("wabbaMenu_Accept");
			skse.CloseMenu("CustomMenu");
			});
			Tween.LinearTween(this,"_alpha", this._alpha, 0, 0.2, onCompleteMove);
		}
	}
	
	private function doCancel(): Void
	{
		if (!moving)
		{
		moving = true;
			var onCompleteMove:Function = Delegate.create(this, function ()
			{
				skse.SendModEvent("wabbaMenu_Ignore");
				skse.CloseMenu("CustomMenu");
			});
			Tween.LinearTween(this,"_alpha", this._alpha, 0, 0.5, onCompleteMove);
		}
	}
	
	private function highlightAccept(): Void
	{
		currentSelection = true;
		defaultOption.bg._alpha = 100;
	}
	
	private function highlightCancel(): Void
	{
		currentSelection = false;
		otherOption.bg._alpha = 100;
	}
	
	private function unHighlightAccept(): Void
	{
		defaultOption.bg._alpha = 70;
	}
	
	private function unHighlightCancel(): Void
	{
		otherOption.bg._alpha = 70;
	}
}