unit ENSchemeAttachmentController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENSchemeController 
;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"
  // !:date            - "http://www.w3.org/2001/XMLSchema"
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  ENSchemeAttachment            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSchemeAttachmentRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;

  ArrayOfByte = array of Byte;  

  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSchemeAttachment = class(TRemotable)
  private
    Fcode : Integer; 
    FuserGen : WideString;
    FcommentGen : WideString;
    FattachmentDate : TXSDate;
    FschemeFile : ArrayOfByte;
    FschemeName : WideString;
    FschemeExt : WideString;
    FisPacked : Integer; 
//???
    FschemeRef : ENSchemeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property userGen : WideString read FuserGen write FuserGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property attachmentDate : TXSDate read FattachmentDate write FattachmentDate;
    property schemeFile: ArrayOfByte read FschemeFile write FschemeFile;
    property schemeName : WideString read FschemeName write FschemeName;
    property schemeExt : WideString read FschemeExt write FschemeExt;
    property isPacked : Integer read FisPacked write FisPacked;
    property schemeRef : ENSchemeRef read FschemeRef write FschemeRef; 
  end;
  
{
  ENSchemeAttachmentFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FuserGen : WideString;
    FcommentGen : WideString;
    FattachmentDate : TXSDate;
    FschemeFile : ArrayOfByte;
    FschemeName : WideString;
    FschemeExt : WideString;
    FisPacked : Integer; 
//???
    FschemeRef : ENSchemeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property userGen : WideString read FuserGen write FuserGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property attachmentDate : TXSDate read FattachmentDate write FattachmentDate;
    property schemeFile : ArrayOfByte read FschemeFile write FschemeFile;
    property schemeName : WideString read FschemeName write FschemeName;
    property schemeExt : WideString read FschemeExt write FschemeExt;
    property  isPacked : Integer read FisPacked write FisPacked; 
    property schemeRef : ENSchemeRef read FschemeRef write FschemeRef; 
  end;
}

  ENSchemeAttachmentFilter = class(ENSchemeAttachment)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENSchemeAttachmentShort = class(TRemotable)
  private
    Fcode : Integer; 
    FuserGen : WideString;
    FcommentGen : WideString;
    FattachmentDate : TXSDate;	
    FschemeFile : ArrayOfByte;
    FschemeName : WideString;
    FschemeExt : WideString;
    FisPacked : Integer; 
    FschemeRefCode : Integer; 
    FschemeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property userGen : WideString read FuserGen write FuserGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property attachmentDate : TXSDate read FattachmentDate write FattachmentDate;
    property schemeFile : ArrayOfByte read FschemeFile write FschemeFile;
    property schemeName : WideString read FschemeName write FschemeName;
    property schemeExt : WideString read FschemeExt write FschemeExt;
    property isPacked : Integer read FisPacked write FisPacked; 

    property schemeRefCode : Integer read FschemeRefCode write FschemeRefCode; 
    property schemeRefName : WideString read FschemeRefName write FschemeRefName; 
  end;

  ArrayOfENSchemeAttachmentShort = array of ENSchemeAttachmentShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSchemeAttachmentShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSchemeAttachmentShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSchemeAttachmentShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSchemeAttachmentController/message/
  // soapAction: http://ksoe.org/ENSchemeAttachmentController/action/ENSchemeAttachmentController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSchemeAttachmentControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSchemeAttachmentController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSchemeAttachmentControllerSoapPort = interface(IInvokable)
  ['{12b412b4-12b4-12b4-12b4-12b412b412b4}']
    function  add(const aENSchemeAttachment: ENSchemeAttachment): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSchemeAttachment: ENSchemeAttachment); stdcall;
    function  getObject(const anObjectCode: Integer): ENSchemeAttachment; stdcall;
    function  getList: ENSchemeAttachmentShortList; stdcall;
    function  getFilteredList(const aENSchemeAttachmentFilter: ENSchemeAttachmentFilter): ENSchemeAttachmentShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSchemeAttachmentShortList; stdcall;
    function  getScrollableFilteredList(const aENSchemeAttachmentFilter: ENSchemeAttachmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSchemeAttachmentShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSchemeAttachmentShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENSchemeAttachmentFilter: ENSchemeAttachmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENSchemeAttachment.Destroy;
  begin
    if Assigned(FattachmentDate) then
      attachmentDate.Free;
    if Assigned(FschemeRef) then
      schemeRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENSchemeAttachmentFilter.Destroy;
  begin
    if Assigned(FattachmentDate) then
      attachmentDate.Free;
    if Assigned(FschemeRef) then
      schemeRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENSchemeAttachmentFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENSchemeAttachmentShort.Destroy;
  begin
    if Assigned(FattachmentDate) then
      attachmentDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENSchemeAttachmentShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;



initialization

  RemClassRegistry.RegisterXSClass(ENSchemeAttachment, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSchemeAttachment');
  RemClassRegistry.RegisterXSClass(ENSchemeAttachmentRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSchemeAttachmentRef');
  RemClassRegistry.RegisterXSClass(ENSchemeAttachmentFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSchemeAttachmentFilter');
  RemClassRegistry.RegisterXSClass(ENSchemeAttachmentShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSchemeAttachmentShort');
  RemClassRegistry.RegisterXSClass(ENSchemeAttachmentShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSchemeAttachmentShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSchemeAttachmentShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSchemeAttachmentShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSchemeAttachmentControllerSoapPort), 'http://ksoe.org/ENSchemeAttachmentController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSchemeAttachmentControllerSoapPort), 'http://ksoe.org/ENSchemeAttachmentController/action/ENSchemeAttachmentController.%operationName%');


end.
