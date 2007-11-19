function ShowScreenShot(strURL)
{
	popupwnd = window.open(strURL, "Screenshot", "toolbar=no,status=yes,resize=yes");
}

function RunApplet(strURL, nWidth, nHeight)
{
	popupwnd = window.open(strURL, "Applet", "toolbar=no,status=yes,width="+nWidth+",height="+nHeight+",scrollbars=no,resize=no");
}

function ShowExample(strURL)
{
	popupwnd = window.open(strURL, "Example", "toolbar=no,status=yes,width=400,height=400,scrollbars=yes");
}
