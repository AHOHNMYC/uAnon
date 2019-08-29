CLSID_FilterGraph GUID e436ebb3-524f-11ce-9f53-0020af0ba770
IID_IGraphBuilder GUID 56a868a9-0ad4-11ce-b03a-0020af0ba770
IID_IMediaControl GUID 56a868b1-0ad4-11ce-b03a-0020af0ba770

com_interface IMediaControl,          \
        QueryInterface,               \
        AddRef,                       \
        Release,                      \
\
        .GetTypeInfoCount,            \
        .GetTypeInfo,                 \
        .GetIDsOfNames,               \
        .Invoke,                      \
\
        Run,                          \
        Pause,                        \
        Stop,                         \
        GetState,                     \
        RenderFile,                   \
        AddSourceFilter,              \
        get_FilterCollection,         \
        get_RegFilterCollection,      \
        StopWhenReady

com_interface IGraphBuilder,          \
        QueryInterface,               \
        AddRef,                       \
        Release,                      \
\
        AddFilter,                    \
        RemoveFilter,                 \
        EnumFilters,                  \
        FindFilterByName,             \
        ConnectDirect,                \
        Reconnect,                    \
        Disconnect,                   \
        SetDefaultSyncSource,         \
\
        Connect,                      \
        Render,                       \
        RenderFile,                   \
        AddSourceFilter,              \
        SetLogFile,                   \
        Abort,                        \
        ShouldOperationContinue
