unit ENReconstrModernOZ2DFDocController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENReconstrModernOZController
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

  ENReconstrModernOZ2DFDoc            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENReconstrModernOZ2DFDocRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENReconstrModernOZ2DFDoc = class(TRemotable)
  private
    Fcode : Integer;
    FdfDocCode : Integer;
    FdfDocTypeCode : Integer;
    FdfDocSubtypeCode : Integer;
    FdfDocNumber : WideString;
    FdfDocDate : TXSDate;
    FdfDocDescription : WideString;
    Fcommentgen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FenReconstrModernOzRef : ENReconstrModernOZRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property dfDocCode : Integer read FdfDocCode write FdfDocCode;
    property dfDocTypeCode : Integer read FdfDocTypeCode write FdfDocTypeCode;
    property dfDocSubtypeCode : Integer read FdfDocSubtypeCode write FdfDocSubtypeCode;
    property dfDocNumber : WideString read FdfDocNumber write FdfDocNumber;
    property dfDocDate : TXSDate read FdfDocDate write FdfDocDate;
    property dfDocDescription : WideString read FdfDocDescription write FdfDocDescription;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property enReconstrModernOzRef : ENReconstrModernOZRef read FenReconstrModernOzRef write FenReconstrModernOzRef;
  end;

{
  ENReconstrModernOZ2DFDocFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdfDocCode : Integer;
    FdfDocTypeCode : Integer;
    FdfDocSubtypeCode : Integer;
    FdfDocNumber : WideString;
    FdfDocDate : TXSDate;
    FdfDocDescription : WideString;
    Fcommentgen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FenReconstrModernOzRef : ENReconstrModernOZRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property dfDocCode : Integer read FdfDocCode write FdfDocCode;
    property dfDocTypeCode : Integer read FdfDocTypeCode write FdfDocTypeCode;
    property dfDocSubtypeCode : Integer read FdfDocSubtypeCode write FdfDocSubtypeCode;
    property dfDocNumber : WideString read FdfDocNumber write FdfDocNumber;
    property dfDocDate : TXSDate read FdfDocDate write FdfDocDate;
    property dfDocDescription : WideString read FdfDocDescription write FdfDocDescription;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property enReconstrModernOzRef : ENReconstrModernOZRef read FenReconstrModernOzRef write FenReconstrModernOzRef;
  end;
}

  ENReconstrModernOZ2DFDocFilter = class(ENReconstrModernOZ2DFDoc)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENReconstrModernOZ2DFDocShort = class(TRemotable)
  private
    Fcode : Integer;
    FdfDocCode : Integer;
    FdfDocTypeCode : Integer;
    FdfDocSubtypeCode : Integer;
    FdfDocNumber : WideString;
    FdfDocDate : TXSDate;
    FdfDocDescription : WideString;
    Fcommentgen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FenReconstrModernOzRefCode : Integer;
    FenReconstrModernOzRefNumbergen : WideString;
    FenReconstrModernOzRefDateGen : TXSDate;
    FenReconstrModernOzRefDateEdit : TXSDate;
    FenReconstrModernOzRefSummaGen : TXSDecimal;
    FenReconstrModernOzRefSummaNDS : TXSDecimal;
    FenReconstrModernOzRefCharacteristic : WideString;
    FenReconstrModernOzRefExecutedPosition : WideString;
    FenReconstrModernOzRefExecutedName : WideString;
    FenReconstrModernOzRefAcceptedPosition : WideString;
    FenReconstrModernOzRefAcceptedName : WideString;
    FenReconstrModernOzRefContractPrice : TXSDecimal;
    FenReconstrModernOzRefCodeMol : WideString;
    FenReconstrModernOzRefCodePodr : WideString;
    FenReconstrModernOzRefInvNumberOZ : WideString;
    FenReconstrModernOzRefNameOZ : WideString;
    FenReconstrModernOzRefFinContractNumber : WideString;
    FenReconstrModernOzRefFinContractDate : TXSDate;
    FenReconstrModernOzRefPartnerName : WideString;
    FenReconstrModernOzRefPartnerCode : WideString;
    FenReconstrModernOzRefCharacteristicOS : WideString;
    FenReconstrModernOzRefIsInvestProgram : Integer;
    FenReconstrModernOzRefYearInvestProgram : WideString;
    FenReconstrModernOzRefItemInvestProgram : WideString;
    FenReconstrModernOzRefTypeRM : Integer;
    FenReconstrModernOzRefUserGen : WideString;
    FenReconstrModernOzRefTermUseful : Integer;
    FenReconstrModernOzRefUse_limit_before : Integer;
    FenReconstrModernOzRefUse_limit_n_before : Integer;
    FenReconstrModernOzRefDateExploitationIn : TXSDate;
    FenReconstrModernOzRefDateExploitationOut : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  dfDocCode : Integer read FdfDocCode write FdfDocCode;
    property  dfDocTypeCode : Integer read FdfDocTypeCode write FdfDocTypeCode;
    property  dfDocSubtypeCode : Integer read FdfDocSubtypeCode write FdfDocSubtypeCode;
    property dfDocNumber : WideString read FdfDocNumber write FdfDocNumber;
    property dfDocDate : TXSDate read FdfDocDate write FdfDocDate;
    property dfDocDescription : WideString read FdfDocDescription write FdfDocDescription;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property enReconstrModernOzRefCode : Integer read FenReconstrModernOzRefCode write FenReconstrModernOzRefCode;
    property enReconstrModernOzRefNumbergen : WideString read FenReconstrModernOzRefNumbergen write FenReconstrModernOzRefNumbergen;
    property enReconstrModernOzRefDateGen : TXSDate read FenReconstrModernOzRefDateGen write FenReconstrModernOzRefDateGen;
    property enReconstrModernOzRefDateEdit : TXSDate read FenReconstrModernOzRefDateEdit write FenReconstrModernOzRefDateEdit;
    property enReconstrModernOzRefSummaGen : TXSDecimal read FenReconstrModernOzRefSummaGen write FenReconstrModernOzRefSummaGen;
    property enReconstrModernOzRefSummaNDS : TXSDecimal read FenReconstrModernOzRefSummaNDS write FenReconstrModernOzRefSummaNDS;
    property enReconstrModernOzRefCharacteristic : WideString read FenReconstrModernOzRefCharacteristic write FenReconstrModernOzRefCharacteristic;
    property enReconstrModernOzRefExecutedPosition : WideString read FenReconstrModernOzRefExecutedPosition write FenReconstrModernOzRefExecutedPosition;
    property enReconstrModernOzRefExecutedName : WideString read FenReconstrModernOzRefExecutedName write FenReconstrModernOzRefExecutedName;
    property enReconstrModernOzRefAcceptedPosition : WideString read FenReconstrModernOzRefAcceptedPosition write FenReconstrModernOzRefAcceptedPosition;
    property enReconstrModernOzRefAcceptedName : WideString read FenReconstrModernOzRefAcceptedName write FenReconstrModernOzRefAcceptedName;
    property enReconstrModernOzRefContractPrice : TXSDecimal read FenReconstrModernOzRefContractPrice write FenReconstrModernOzRefContractPrice;
    property enReconstrModernOzRefCodeMol : WideString read FenReconstrModernOzRefCodeMol write FenReconstrModernOzRefCodeMol;
    property enReconstrModernOzRefCodePodr : WideString read FenReconstrModernOzRefCodePodr write FenReconstrModernOzRefCodePodr;
    property enReconstrModernOzRefInvNumberOZ : WideString read FenReconstrModernOzRefInvNumberOZ write FenReconstrModernOzRefInvNumberOZ;
    property enReconstrModernOzRefNameOZ : WideString read FenReconstrModernOzRefNameOZ write FenReconstrModernOzRefNameOZ;
    property enReconstrModernOzRefFinContractNumber : WideString read FenReconstrModernOzRefFinContractNumber write FenReconstrModernOzRefFinContractNumber;
    property enReconstrModernOzRefFinContractDate : TXSDate read FenReconstrModernOzRefFinContractDate write FenReconstrModernOzRefFinContractDate;
    property enReconstrModernOzRefPartnerName : WideString read FenReconstrModernOzRefPartnerName write FenReconstrModernOzRefPartnerName;
    property enReconstrModernOzRefPartnerCode : WideString read FenReconstrModernOzRefPartnerCode write FenReconstrModernOzRefPartnerCode;
    property enReconstrModernOzRefCharacteristicOS : WideString read FenReconstrModernOzRefCharacteristicOS write FenReconstrModernOzRefCharacteristicOS;
    property enReconstrModernOzRefIsInvestProgram : Integer read FenReconstrModernOzRefIsInvestProgram write FenReconstrModernOzRefIsInvestProgram;
    property enReconstrModernOzRefYearInvestProgram : WideString read FenReconstrModernOzRefYearInvestProgram write FenReconstrModernOzRefYearInvestProgram;
    property enReconstrModernOzRefItemInvestProgram : WideString read FenReconstrModernOzRefItemInvestProgram write FenReconstrModernOzRefItemInvestProgram;
    property enReconstrModernOzRefTypeRM : Integer read FenReconstrModernOzRefTypeRM write FenReconstrModernOzRefTypeRM;
    property enReconstrModernOzRefUserGen : WideString read FenReconstrModernOzRefUserGen write FenReconstrModernOzRefUserGen;
    property enReconstrModernOzRefTermUseful : Integer read FenReconstrModernOzRefTermUseful write FenReconstrModernOzRefTermUseful;
    property enReconstrModernOzRefUse_limit_before : Integer read FenReconstrModernOzRefUse_limit_before write FenReconstrModernOzRefUse_limit_before;
    property enReconstrModernOzRefUse_limit_n_before : Integer read FenReconstrModernOzRefUse_limit_n_before write FenReconstrModernOzRefUse_limit_n_before;
    property enReconstrModernOzRefDateExploitationIn : TXSDate read FenReconstrModernOzRefDateExploitationIn write FenReconstrModernOzRefDateExploitationIn;
    property enReconstrModernOzRefDateExploitationOut : TXSDate read FenReconstrModernOzRefDateExploitationOut write FenReconstrModernOzRefDateExploitationOut;
  end;

  ArrayOfENReconstrModernOZ2DFDocShort = array of ENReconstrModernOZ2DFDocShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENReconstrModernOZ2DFDocShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENReconstrModernOZ2DFDocShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENReconstrModernOZ2DFDocShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENReconstrModernOZ2DFDocController/message/
  // soapAction: http://ksoe.org/ENReconstrModernOZ2DFDocController/action/ENReconstrModernOZ2DFDocController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENReconstrModernOZ2DFDocControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENReconstrModernOZ2DFDocController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENReconstrModernOZ2DFDocControllerSoapPort = interface(IInvokable)
  ['{84FB5BE5-8C7C-4CBB-A7BC-673FBA9B55C1}']
    function add(const aENReconstrModernOZ2DFDoc: ENReconstrModernOZ2DFDoc): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENReconstrModernOZ2DFDoc: ENReconstrModernOZ2DFDoc); stdcall;
    function getObject(const anObjectCode: Integer): ENReconstrModernOZ2DFDoc; stdcall;
    function getList: ENReconstrModernOZ2DFDocShortList; stdcall;
    function getFilteredList(const aENReconstrModernOZ2DFDocFilter: ENReconstrModernOZ2DFDocFilter): ENReconstrModernOZ2DFDocShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENReconstrModernOZ2DFDocShortList; stdcall;
    function getScrollableFilteredList(const aENReconstrModernOZ2DFDocFilter: ENReconstrModernOZ2DFDocFilter; const aFromPosition: Integer; const aQuantity: Integer): ENReconstrModernOZ2DFDocShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENReconstrModernOZ2DFDocShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENReconstrModernOZ2DFDocFilter: ENReconstrModernOZ2DFDocFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENReconstrModernOZ2DFDocShort; stdcall;
  end;


implementation

  destructor ENReconstrModernOZ2DFDoc.Destroy;
  begin
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FenReconstrModernOzRef) then
      enReconstrModernOzRef.Free;
    inherited Destroy;
  end;

{
  destructor ENReconstrModernOZ2DFDocFilter.Destroy;
  begin
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FenReconstrModernOzRef) then
      enReconstrModernOzRef.Free;
    inherited Destroy;
  end;
}

  destructor ENReconstrModernOZ2DFDocFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENReconstrModernOZ2DFDocShort.Destroy;
  begin
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FenReconstrModernOzRefDateGen) then
      enReconstrModernOzRefDateGen.Free;
    if Assigned(FenReconstrModernOzRefDateEdit) then
      enReconstrModernOzRefDateEdit.Free;
    if Assigned(FenReconstrModernOzRefSummaGen) then
      enReconstrModernOzRefSummaGen.Free;
    if Assigned(FenReconstrModernOzRefSummaNDS) then
      enReconstrModernOzRefSummaNDS.Free;
    if Assigned(FenReconstrModernOzRefContractPrice) then
      enReconstrModernOzRefContractPrice.Free;
    if Assigned(FenReconstrModernOzRefFinContractDate) then
      enReconstrModernOzRefFinContractDate.Free;
    if Assigned(FenReconstrModernOzRefDateExploitationIn) then
      enReconstrModernOzRefDateExploitationIn.Free;
    if Assigned(FenReconstrModernOzRefDateExploitationOut) then
      enReconstrModernOzRefDateExploitationOut.Free;
    inherited Destroy;
  end;

  destructor ENReconstrModernOZ2DFDocShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENReconstrModernOZ2DFDoc, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModernOZ2DFDoc');
  RemClassRegistry.RegisterXSClass(ENReconstrModernOZ2DFDocRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModernOZ2DFDocRef');
  RemClassRegistry.RegisterXSClass(ENReconstrModernOZ2DFDocFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModernOZ2DFDocFilter');
  RemClassRegistry.RegisterXSClass(ENReconstrModernOZ2DFDocShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModernOZ2DFDocShort');
  RemClassRegistry.RegisterXSClass(ENReconstrModernOZ2DFDocShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModernOZ2DFDocShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENReconstrModernOZ2DFDocShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENReconstrModernOZ2DFDocShort');

  InvRegistry.RegisterInterface(TypeInfo(ENReconstrModernOZ2DFDocControllerSoapPort), 'http://ksoe.org/ENReconstrModernOZ2DFDocController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENReconstrModernOZ2DFDocControllerSoapPort), 'http://ksoe.org/ENReconstrModernOZ2DFDocController/action/ENReconstrModernOZ2DFDocController.%operationName%');


end.
