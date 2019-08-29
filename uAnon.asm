include "%lib%/freshlib.inc"
format PE Console 4.0
entry start

section 'rdioAnon' import readable writable executable
include "%finc%/win32/allimports.asm"
data resource from 'uAnon.res'
end data

start:
        invoke CoInitialize, NULL
        invoke CoCreateInstance, CLSID_FilterGraph, NULL, CLSCTX_INPROC_SERVER, IID_IGraphBuilder, graphBuilder

        mov eax, [graphBuilder]
        mov edx, [eax]
        invoke edx+graphBuilder.QueryInterface, eax, IID_IMediaControl, mediaControl

        mov eax, [mediaControl]
        mov edx, [eax]
        push eax     ; for .Run
        push edx     ; for .Run

        invoke edx+mediaControl.RenderFile, eax, anonLink

        pop edx
        invoke edx+mediaControl.Run

gmsg:
        invoke GetMessageA, m, NULL, 0, 0
        jmp gmsg

; all .data is her
include "uAnon.inc"
anonLink du 'https://anon.fm/streams/radio',0
graphBuilder IGraphBuilder
mediaControl IMediaControl
m MSG
