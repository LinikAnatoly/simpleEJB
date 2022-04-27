unit ENBuilding2ENactController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENActController
   ,ENBuildingController
   ,ENBuilding2ActTypeWorkController
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

  ENBuilding2ENact            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuilding2ENactRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuilding2ENact = class(TRemotable)
  private
    Fcode : Integer;
    FsumGen : TXSDecimal;
    FsumNds : TXSDecimal;
    FisCalculationDate : Integer;
    FfinContractNumber : WideString;
    FfinContractDate : TXSDate;
    FpartnerName : WideString;
    FpartnerCode : WideString;
    FisActFromEnergyNET : TXSBoolean;
    FactNumber : WideString;
    FactDate : TXSDateTime;
//???
    FactRef : ENActRef;
//???
    FENBuildingRef : ENBuildingRef;
//???
    FENBuilding2ActTypeWorkRef : ENBuilding2ActTypeWorkRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property sumNds : TXSDecimal read FsumNds write FsumNds;
    property isCalculationDate : Integer read FisCalculationDate write FisCalculationDate;
    property finContractNumber : WideString read FfinContractNumber write FfinContractNumber;
    property finContractDate : TXSDate read FfinContractDate write FfinContractDate;
    property partnerName : WideString read FpartnerName write FpartnerName;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property isActFromEnergyNET : TXSBoolean read FisActFromEnergyNET write FisActFromEnergyNET;
    property actNumber : WideString read FactNumber write FactNumber;
    property actDate : TXSDateTime read FactDate write FactDate;
    property actRef : ENActRef read FactRef write FactRef;
    property ENBuildingRef : ENBuildingRef read FENBuildingRef write FENBuildingRef;
    property ENBuilding2ActTypeWorkRef : ENBuilding2ActTypeWorkRef read FENBuilding2ActTypeWorkRef write FENBuilding2ActTypeWorkRef;
  end;

{
  ENBuilding2ENactFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FsumGen : TXSDecimal;
    FsumNds : TXSDecimal;
    FisCalculationDate : Integer;
    FfinContractNumber : WideString;
    FfinContractDate : TXSDate;
    FpartnerName : WideString;
    FpartnerCode : WideString;
    FisActFromEnergyNET : TXSBoolean;
    FactNumber : WideString;
    FactDate : TXSDateTime;
//???
    FactRef : ENActRef;
//???
    FENBuildingRef : ENBuildingRef;
//???
    FENBuilding2ActTypeWorkRef : ENBuilding2ActTypeWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property sumNds : TXSDecimal read FsumNds write FsumNds;
    property isCalculationDate : Integer read FisCalculationDate write FisCalculationDate;
    property finContractNumber : WideString read FfinContractNumber write FfinContractNumber;
    property finContractDate : TXSDate read FfinContractDate write FfinContractDate;
    property partnerName : WideString read FpartnerName write FpartnerName;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property isActFromEnergyNET : TXSBoolean read FisActFromEnergyNET write FisActFromEnergyNET;
    property actNumber : WideString read FactNumber write FactNumber;
    property actDate : TXSDateTime read FactDate write FactDate;
    property actRef : ENActRef read FactRef write FactRef;
    property ENBuildingRef : ENBuildingRef read FENBuildingRef write FENBuildingRef;
    property ENBuilding2ActTypeWorkRef : ENBuilding2ActTypeWorkRef read FENBuilding2ActTypeWorkRef write FENBuilding2ActTypeWorkRef;
  end;
}

  ENBuilding2ENactFilter = class(ENBuilding2ENact)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENBuilding2ENactShort = class(TRemotable)
  private
    Fcode : Integer;
    FsumGen : TXSDecimal;
    FsumNds : TXSDecimal;
    FisCalculationDate : Integer;
    FfinContractNumber : WideString;
    FfinContractDate : TXSDate;
    FpartnerName : WideString;
    FpartnerCode : WideString;
    FisActFromEnergyNET : TXSBoolean;
    FactNumber : WideString;
    FactDate : TXSDateTime;
    FactRefCode : Integer;
    FactRefNumberGen : WideString;
    FactRefDateGen : TXSDate;
    FactRefFinMolCode : WideString;
    FactRefFinMolName : WideString;
    FactRefFinMechanicName : WideString;
    FactRefInvNumber : WideString;
    FactRefUserGen : WideString;
    FactRefDateEdit : TXSDate;
    FactRefDateAct : TXSDate;
    FactRefMolCodeObject : WideString;
    FactRefCheckedByAccountant : TXSBoolean;
    FENBuildingRefCode : Integer;
    FENBuildingRefNumbergen : WideString;
    FENBuildingRefDateGen : TXSDate;
    FENBuildingRefDateEdit : TXSDate;
    FENBuildingRefSummaGen : TXSDecimal;
    FENBuildingRefSummaNDS : TXSDecimal;
    FENBuildingRefCharacteristic : WideString;
    FENBuildingRefExecutedPosition : WideString;
    FENBuildingRefExecutedName : WideString;
    FENBuildingRefAcceptedPosition : WideString;
    FENBuildingRefAcceptedName : WideString;
    FENBuildingRefContractPrice : TXSDecimal;
    FENBuildingRefCodeMol : WideString;
    FENBuildingRefCodePodr : WideString;
    FENBuildingRefInvNumberOZ : WideString;
    FENBuildingRefNameOZ : WideString;
    FENBuildingRefFinContractNumber : WideString;
    FENBuildingRefFinContractDate : TXSDate;
    FENBuildingRefPartnerName : WideString;
    FENBuildingRefPartnerCode : WideString;
    FENBuildingRefIsInvestProgram : Integer;
    FENBuildingRefYearInvestProgram : WideString;
    FENBuildingRefItemInvestProgram : WideString;
    FENBuildingRefBuildingAddress : WideString;
    FENBuildingRefDecreeNumber : WideString;
    FENBuildingRefDecreeDate : TXSDate;
    FENBuildingRefExploitationTerm : Integer;
    FENBuildingRefDateLoadExpl : TXSDate;
    FENBuildingRefDateBuild : TXSDate;
    FENBuildingRefUserGen : WideString;
    FENBuilding2ActTypeWorkRefCode : Integer;
    FENBuilding2ActTypeWorkRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property sumNds : TXSDecimal read FsumNds write FsumNds;
    property  isCalculationDate : Integer read FisCalculationDate write FisCalculationDate;
    property finContractNumber : WideString read FfinContractNumber write FfinContractNumber;
    property finContractDate : TXSDate read FfinContractDate write FfinContractDate;
    property partnerName : WideString read FpartnerName write FpartnerName;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property isActFromEnergyNET : TXSBoolean read FisActFromEnergyNET write FisActFromEnergyNET;
    property actNumber : WideString read FactNumber write FactNumber;
    property actDate : TXSDateTime read FactDate write FactDate;

    property actRefCode : Integer read FactRefCode write FactRefCode;
    property actRefNumberGen : WideString read FactRefNumberGen write FactRefNumberGen;
    property actRefDateGen : TXSDate read FactRefDateGen write FactRefDateGen;
    property actRefFinMolCode : WideString read FactRefFinMolCode write FactRefFinMolCode;
    property actRefFinMolName : WideString read FactRefFinMolName write FactRefFinMolName;
    property actRefFinMechanicName : WideString read FactRefFinMechanicName write FactRefFinMechanicName;
    property actRefInvNumber : WideString read FactRefInvNumber write FactRefInvNumber;
    property actRefUserGen : WideString read FactRefUserGen write FactRefUserGen;
    property actRefDateEdit : TXSDate read FactRefDateEdit write FactRefDateEdit;
    property actRefDateAct : TXSDate read FactRefDateAct write FactRefDateAct;
    property actRefMolCodeObject : WideString read FactRefMolCodeObject write FactRefMolCodeObject;
    property actRefCheckedByAccountant : TXSBoolean read FactRefCheckedByAccountant write FactRefCheckedByAccountant;
    property ENBuildingRefCode : Integer read FENBuildingRefCode write FENBuildingRefCode;
    property ENBuildingRefNumbergen : WideString read FENBuildingRefNumbergen write FENBuildingRefNumbergen;
    property ENBuildingRefDateGen : TXSDate read FENBuildingRefDateGen write FENBuildingRefDateGen;
    property ENBuildingRefDateEdit : TXSDate read FENBuildingRefDateEdit write FENBuildingRefDateEdit;
    property ENBuildingRefSummaGen : TXSDecimal read FENBuildingRefSummaGen write FENBuildingRefSummaGen;
    property ENBuildingRefSummaNDS : TXSDecimal read FENBuildingRefSummaNDS write FENBuildingRefSummaNDS;
    property ENBuildingRefCharacteristic : WideString read FENBuildingRefCharacteristic write FENBuildingRefCharacteristic;
    property ENBuildingRefExecutedPosition : WideString read FENBuildingRefExecutedPosition write FENBuildingRefExecutedPosition;
    property ENBuildingRefExecutedName : WideString read FENBuildingRefExecutedName write FENBuildingRefExecutedName;
    property ENBuildingRefAcceptedPosition : WideString read FENBuildingRefAcceptedPosition write FENBuildingRefAcceptedPosition;
    property ENBuildingRefAcceptedName : WideString read FENBuildingRefAcceptedName write FENBuildingRefAcceptedName;
    property ENBuildingRefContractPrice : TXSDecimal read FENBuildingRefContractPrice write FENBuildingRefContractPrice;
    property ENBuildingRefCodeMol : WideString read FENBuildingRefCodeMol write FENBuildingRefCodeMol;
    property ENBuildingRefCodePodr : WideString read FENBuildingRefCodePodr write FENBuildingRefCodePodr;
    property ENBuildingRefInvNumberOZ : WideString read FENBuildingRefInvNumberOZ write FENBuildingRefInvNumberOZ;
    property ENBuildingRefNameOZ : WideString read FENBuildingRefNameOZ write FENBuildingRefNameOZ;
    property ENBuildingRefFinContractNumber : WideString read FENBuildingRefFinContractNumber write FENBuildingRefFinContractNumber;
    property ENBuildingRefFinContractDate : TXSDate read FENBuildingRefFinContractDate write FENBuildingRefFinContractDate;
    property ENBuildingRefPartnerName : WideString read FENBuildingRefPartnerName write FENBuildingRefPartnerName;
    property ENBuildingRefPartnerCode : WideString read FENBuildingRefPartnerCode write FENBuildingRefPartnerCode;
    property ENBuildingRefIsInvestProgram : Integer read FENBuildingRefIsInvestProgram write FENBuildingRefIsInvestProgram;
    property ENBuildingRefYearInvestProgram : WideString read FENBuildingRefYearInvestProgram write FENBuildingRefYearInvestProgram;
    property ENBuildingRefItemInvestProgram : WideString read FENBuildingRefItemInvestProgram write FENBuildingRefItemInvestProgram;
    property ENBuildingRefBuildingAddress : WideString read FENBuildingRefBuildingAddress write FENBuildingRefBuildingAddress;
    property ENBuildingRefDecreeNumber : WideString read FENBuildingRefDecreeNumber write FENBuildingRefDecreeNumber;
    property ENBuildingRefDecreeDate : TXSDate read FENBuildingRefDecreeDate write FENBuildingRefDecreeDate;
    property ENBuildingRefExploitationTerm : Integer read FENBuildingRefExploitationTerm write FENBuildingRefExploitationTerm;
    property ENBuildingRefDateLoadExpl : TXSDate read FENBuildingRefDateLoadExpl write FENBuildingRefDateLoadExpl;
    property ENBuildingRefDateBuild : TXSDate read FENBuildingRefDateBuild write FENBuildingRefDateBuild;
    property ENBuildingRefUserGen : WideString read FENBuildingRefUserGen write FENBuildingRefUserGen;
    property ENBuilding2ActTypeWorkRefCode : Integer read FENBuilding2ActTypeWorkRefCode write FENBuilding2ActTypeWorkRefCode;
    property ENBuilding2ActTypeWorkRefName : WideString read FENBuilding2ActTypeWorkRefName write FENBuilding2ActTypeWorkRefName;
  end;

  ArrayOfENBuilding2ENactShort = array of ENBuilding2ENactShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBuilding2ENactShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBuilding2ENactShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBuilding2ENactShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBuilding2ENactController/message/
  // soapAction: http://ksoe.org/ENBuilding2ENactController/action/ENBuilding2ENactController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBuilding2ENactControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBuilding2ENactController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBuilding2ENactControllerSoapPort = interface(IInvokable)
  ['{9953A3CE-1D5C-4706-8D5A-662AAB1B995B}']
    function add(const aENBuilding2ENact: ENBuilding2ENact): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBuilding2ENact: ENBuilding2ENact); stdcall;
    function getObject(const anObjectCode: Integer): ENBuilding2ENact; stdcall;
    function getList: ENBuilding2ENactShortList; stdcall;
    function getFilteredList(const aENBuilding2ENactFilter: ENBuilding2ENactFilter): ENBuilding2ENactShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBuilding2ENactShortList; stdcall;
    function getScrollableFilteredList(const aENBuilding2ENactFilter: ENBuilding2ENactFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBuilding2ENactShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBuilding2ENactShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENBuilding2ENactFilter: ENBuilding2ENactFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENBuilding2ENactShort; stdcall;
  end;


implementation

  destructor ENBuilding2ENact.Destroy;
  begin
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FfinContractDate) then
      finContractDate.Free;
    if Assigned(FisActFromEnergyNET) then
      isActFromEnergyNET.Free;
    if Assigned(FactDate) then
      actDate.Free;
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(FENBuildingRef) then
      ENBuildingRef.Free;
    if Assigned(FENBuilding2ActTypeWorkRef) then
      ENBuilding2ActTypeWorkRef.Free;
    inherited Destroy;
  end;

{
  destructor ENBuilding2ENactFilter.Destroy;
  begin
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FfinContractDate) then
      finContractDate.Free;
    if Assigned(FisActFromEnergyNET) then
      isActFromEnergyNET.Free;
    if Assigned(FactDate) then
      actDate.Free;
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(FENBuildingRef) then
      ENBuildingRef.Free;
    if Assigned(FENBuilding2ActTypeWorkRef) then
      ENBuilding2ActTypeWorkRef.Free;
    inherited Destroy;
  end;
}

  destructor ENBuilding2ENactFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENBuilding2ENactShort.Destroy;
  begin
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FfinContractDate) then
      finContractDate.Free;
    if Assigned(FisActFromEnergyNET) then
      isActFromEnergyNET.Free;
    if Assigned(FactDate) then
      actDate.Free;
    if Assigned(FactRefDateGen) then
      actRefDateGen.Free;
    if Assigned(FactRefDateEdit) then
      actRefDateEdit.Free;
    if Assigned(FactRefDateAct) then
      actRefDateAct.Free;
    if Assigned(FENBuildingRefDateGen) then
      ENBuildingRefDateGen.Free;
    if Assigned(FENBuildingRefDateEdit) then
      ENBuildingRefDateEdit.Free;
    if Assigned(FENBuildingRefSummaGen) then
      ENBuildingRefSummaGen.Free;
    if Assigned(FENBuildingRefSummaNDS) then
      ENBuildingRefSummaNDS.Free;
    if Assigned(FENBuildingRefContractPrice) then
      ENBuildingRefContractPrice.Free;
    if Assigned(FENBuildingRefFinContractDate) then
      ENBuildingRefFinContractDate.Free;
    if Assigned(FENBuildingRefDecreeDate) then
      ENBuildingRefDecreeDate.Free;
    if Assigned(FENBuildingRefDateLoadExpl) then
      ENBuildingRefDateLoadExpl.Free;
    if Assigned(FENBuildingRefDateBuild) then
      ENBuildingRefDateBuild.Free;
    inherited Destroy;
  end;

  destructor ENBuilding2ENactShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBuilding2ENact, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2ENact');
  RemClassRegistry.RegisterXSClass(ENBuilding2ENactRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2ENactRef');
  RemClassRegistry.RegisterXSClass(ENBuilding2ENactFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2ENactFilter');
  RemClassRegistry.RegisterXSClass(ENBuilding2ENactShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2ENactShort');
  RemClassRegistry.RegisterXSClass(ENBuilding2ENactShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2ENactShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBuilding2ENactShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBuilding2ENactShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBuilding2ENactControllerSoapPort), 'http://ksoe.org/ENBuilding2ENactController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBuilding2ENactControllerSoapPort), 'http://ksoe.org/ENBuilding2ENactController/action/ENBuilding2ENactController.%operationName%');


end.
