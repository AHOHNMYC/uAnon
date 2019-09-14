include "%lib%/freshlib.inc"
format PE Console 4.0
entry start

section 'rdioAnon' import readable writable executable
; import
include '%finc%/win32/allimports.asm'

; resources (icon)
data resource from 'uAnon.res'
end data

; data
include 'uAnon.inc'
mediaControl IMediaControl
graphBuilder IGraphBuilder
anonLink du 'https://anon.fm/streams/radio',0
m MSG

; code
start:
        invoke CoInitialize, NULL
        invoke CoCreateInstance, CLSID_FilterGraph, NULL, CLSCTX_INPROC_SERVER, IID_IGraphBuilder, graphBuilder
        cominvk graphBuilder, QueryInterface, IID_IMediaControl, mediaControl
        cominvk mediaControl, RenderFile, anonLink
        cominvk mediaControl, Run
gmsg:
        invoke GetMessageA, m, NULL, 0, 0
        jmp gmsg
