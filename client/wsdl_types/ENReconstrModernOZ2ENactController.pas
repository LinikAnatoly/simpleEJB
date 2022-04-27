unit ENReconstrModernOZ2ENactController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENActController 
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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  ENReconstrModernOZ2ENact            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENReconstrModernOZ2ENactRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENReconstrModernOZ2ENact = class(TRemotable)
  private
    Fcode : Integer; 
//???
    FactRef : ENActRef;
//???
    FENReconstrModernOZRef : ENReconstrModernOZRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property actRef : ENActRef read FactRef write FactRef; 
    property ENReconstrModernOZRef : ENReconstrModernOZRef read FENReconstrModernOZRef write FENReconstrModernOZRef; 
  end;
  
{
  ENReconstrModernOZ2ENactFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
//???
    FactRef : ENActRef;
//???
    FENReconstrModernOZRef : ENReconstrModernOZRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property actRef : ENActRef read FactRef write FactRef; 
    property ENReconstrModernOZRef : ENReconstrModernOZRef read FENReconstrModernOZRef write FENReconstrModernOZRef; 
  end;
}

  ENReconstrModernOZ2ENactFilter = class(ENReconstrModernOZ2ENact)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENReconstrModernOZ2ENactShort = class(TRemotable)
  private
    Fcode : Integer;
    FsumGen : TXSDecimal;
    FactRefCode : Integer; 
    FactRefNumberGen : WideString;
    FactRefDateGen : TXSDate;
    FactRefFinDocCode : Integer; 
    FactRefFinDocMechanicCode : Integer; 
    FactRefFinMolName : WideString;
    FactRefFinMechanicName : WideString;
    FactRefInvNumber : WideString;
    FactRefUserGen : WideString;
    FactRefDateEdit : TXSDate;
    FactRefDateAct : TXSDate;
    FENReconstrModernOZRefCode : Integer; 
    FENReconstrModernOZRefNumbergen : WideString;
    FENReconstrModernOZRefDateGen : TXSDate;
    FENReconstrModernOZRefDateEdit : TXSDate;
    FENReconstrModernOZRefSummaGen : TXSDecimal;
    FENReconstrModernOZRefCharacteristic : WideString;
    FENReconstrModernOZRefExecutedPosition : WideString;
    FENReconstrModernOZRefExecutedName : WideString;
    FENReconstrModernOZRefAcceptedPosition : WideString;
    FENReconstrModernOZRefAcceptedName : WideString;
    FENReconstrModernOZRefContractPrice : TXSDecimal;
    FENReconstrModernOZRefCodeMol : WideString;
    FENReconstrModernOZRefCodePodr : WideString;
    FENReconstrModernOZRefUserGen : WideString;
    FisCalculationDate : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property actRefCode : Integer read FactRefCode write FactRefCode;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property actRefNumberGen : WideString read FactRefNumberGen write FactRefNumberGen; 
    property actRefDateGen : TXSDate read FactRefDateGen write FactRefDateGen; 
    property actRefFinDocCode : Integer read FactRefFinDocCode write FactRefFinDocCode; 
    property actRefFinDocMechanicCode : Integer read FactRefFinDocMechanicCode write FactRefFinDocMechanicCode; 
    property actRefFinMolName : WideString read FactRefFinMolName write FactRefFinMolName; 
    property actRefFinMechanicName : WideString read FactRefFinMechanicName write FactRefFinMechanicName; 
    property actRefInvNumber : WideString read FactRefInvNumber write FactRefInvNumber; 
    property actRefUserGen : WideString read FactRefUserGen write FactRefUserGen; 
    property actRefDateEdit : TXSDate read FactRefDateEdit write FactRefDateEdit; 
    property actRefDateAct : TXSDate read FactRefDateAct write FactRefDateAct; 
    property ENReconstrModernOZRefCode : Integer read FENReconstrModernOZRefCode write FENReconstrModernOZRefCode; 
    property ENReconstrModernOZRefNumbergen : WideString read FENReconstrModernOZRefNumbergen write FENReconstrModernOZRefNumbergen;
    property ENReconstrModernOZRefDateGen : TXSDate read FENReconstrModernOZRefDateGen write FENReconstrModernOZRefDateGen; 
    property ENReconstrModernOZRefDateEdit : TXSDate read FENReconstrModernOZRefDateEdit write FENReconstrModernOZRefDateEdit; 
    property ENReconstrModernOZRefSummaGen : TXSDecimal read FENReconstrModernOZRefSummaGen write FENReconstrModernOZRefSummaGen;
    property ENReconstrModernOZRefCharacteristic : WideString read FENReconstrModernOZRefCharacteristic write FENReconstrModernOZRefCharacteristic; 
    property ENReconstrModernOZRefExecutedPosition : WideString read FENReconstrModernOZRefExecutedPosition write FENReconstrModernOZRefExecutedPosition; 
    property ENReconstrModernOZRefExecutedName : WideString read FENReconstrModernOZRefExecutedName write FENReconstrModernOZRefExecutedName; 
    property ENReconstrModernOZRefAcceptedPosition : WideString read FENReconstrModernOZRefAcceptedPosition write FENReconstrModernOZRefAcceptedPosition; 
    property ENReconstrModernOZRefAcceptedName : WideString read FENReconstrModernOZRefAcceptedName write FENReconstrModernOZRefAcceptedName; 
    property ENReconstrModernOZRefContractPrice : TXSDecimal read FENReconstrModernOZRefContractPrice write FENReconstrModernOZRefContractPrice; 
    property ENReconstrModernOZRefCodeMol : WideString read FENReconstrModernOZRefCodeMol write FENReconstrModernOZRefCodeMol; 
    property ENReconstrModernOZRefCodePodr : WideString read FENReconstrModernOZRefCodePodr write FENReconstrModernOZRefCodePodr; 
    property ENReconstrModernOZRefUserGen : WideString read FENReconstrModernOZRefUserGen write FENReconstrModernOZRefUserGen;
    property isCalculationDate : Integer read FisCalculationDate write FisCalculationDate;
  end;

  ArrayOfENReconstrModernOZ2ENactShort = array of ENReconstrModernOZ2ENactShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENReconstrModernOZ2ENactShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENReconstrModernOZ2ENactShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENReconstrModernOZ2ENactShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENReconstrModernOZ2ENactController/message/
  // soapAction: http://ksoe.org/ENReconstrModernOZ2ENactController/action/ENReconstrModernOZ2ENactController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENReconstrModernOZ2ENactControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENReconstrModernOZ2ENactController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENReconstrModernOZ2ENactControllerSoapPort = interface(IInvokable)
  ['{10001000-1000-1000-1000-100010001000}']
    function  add(const aENReconstrModernOZ2ENact: ENReconstrModernOZ2ENact): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENReconstrModernOZ2ENact: ENReconstrModernOZ2ENact); stdcall;
    function  getObject(const anObjectCode: Integer): ENReconstrModernOZ2ENact; stdcall;
    function  getList: ENReconstrModernOZ2ENactShortList; stdcall;
    function  getFilteredList(const aENReconstrModernOZ2ENactFilter: ENReconstrModernOZ2ENactFilter): ENReconstrModernOZ2ENactShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENReconstrModernOZ2ENactShortList; stdcall;
    function  getScrollableFilteredList(const aENReconstrModernOZ2ENactFilter: ENReconstrModernOZ2ENactFilter; const aFromPosition: Integer; const aQuantity: Integer): ENReconstrModernOZ2ENactShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENReconstrModernOZ2ENactShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENReconstrModernOZ2ENactFilter: ENReconstrModernOZ2ENactFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

    function  getScrollableFilteredListForRM(const aENReconstrModernOZ2ENactFilter: ENReconstrModernOZ2ENactFilter; const aFromPosition: Integer; const aQuantity: Integer): ENReconstrModernOZ2ENactShortList; stdcall;

    procedure updateIsCalculationDate(const actCode:Integer ; const ozCode:Integer  ; const isCalculationDate:Integer ); stdcall;

  end;
                                                            

implementation

  destructor ENReconstrModernOZ2ENact.Destroy;
  begin
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(FENReconstrModernOZRef) then
      ENReconstrModernOZRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENReconstrModernOZ2ENactFilter.Destroy;
  begin
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(FENReconstrModernOZRef) then
      ENReconstrModernOZRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENReconstrModernOZ2ENactFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENReconstrModernOZ2ENactShort.Destroy;
  begin
    if Assigned(FactRefDateGen) then
      actRefDateGen.Free;
    if Assigned(FactRefDateEdit) then
      actRefDateEdit.Free;
    if Assigned(FactRefDateAct) then
      actRefDateAct.Free;
    if Assigned(FENReconstrModernOZRefDateGen) then
      ENReconstrModernOZRefDateGen.Free;
    if Assigned(FENReconstrModernOZRefDateEdit) then
      ENReconstrModernOZRefDateEdit.Free;
    if Assigned(FENReconstrModernOZRefSummaGen) then
      ENReconstrModernOZRefSummaGen.Free;
    if Assigned(FENReconstrModernOZRefContractPrice) then
      ENReconstrModernOZRefContractPrice.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    inherited Destroy;
  end; 
  
  destructor ENReconstrModernOZ2ENactShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENReconstrModernOZ2ENact, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModernOZ2ENact');
  RemClassRegistry.RegisterXSClass(ENReconstrModernOZ2ENactRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModernOZ2ENactRef');
  RemClassRegistry.RegisterXSClass(ENReconstrModernOZ2ENactFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModernOZ2ENactFilter');
  RemClassRegistry.RegisterXSClass(ENReconstrModernOZ2ENactShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModernOZ2ENactShort');
  RemClassRegistry.RegisterXSClass(ENReconstrModernOZ2ENactShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModernOZ2ENactShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENReconstrModernOZ2ENactShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENReconstrModernOZ2ENactShort');

  InvRegistry.RegisterInterface(TypeInfo(ENReconstrModernOZ2ENactControllerSoapPort), 'http://ksoe.org/ENReconstrModernOZ2ENactController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENReconstrModernOZ2ENactControllerSoapPort), 'http://ksoe.org/ENReconstrModernOZ2ENactController/action/ENReconstrModernOZ2ENactController.%operationName%');


end.
