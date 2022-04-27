unit ENCalc2ConnectTariffController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENTechConditionsServicesController
   ,ENConnectionTariffEntryController
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

  ENCalc2ConnectTariff            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCalc2ConnectTariffRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCalc2ConnectTariff = class(TRemotable)
  private
    Fcode : Integer;
    Fpower1Tariff : TXSDecimal;
    Ftariff1value : TXSDecimal;
    Fsumma1Tariff : TXSDecimal;
    Fpower2Tariff : TXSDecimal;
    Ftariff2value : TXSDecimal;
    Fsumma2Tariff : TXSDecimal;
    FsummaTotal : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FtechCondServRef : ENTechConditionsServicesRef;
//???
    FtariffEntry1Ref : ENConnectionTariffEntryRef;
//???
    FtariffEntry2Ref : ENConnectionTariffEntryRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property power1Tariff : TXSDecimal read Fpower1Tariff write Fpower1Tariff;
    property tariff1value : TXSDecimal read Ftariff1value write Ftariff1value;
    property summa1Tariff : TXSDecimal read Fsumma1Tariff write Fsumma1Tariff;
    property power2Tariff : TXSDecimal read Fpower2Tariff write Fpower2Tariff;
    property tariff2value : TXSDecimal read Ftariff2value write Ftariff2value;
    property summa2Tariff : TXSDecimal read Fsumma2Tariff write Fsumma2Tariff;
    property summaTotal : TXSDecimal read FsummaTotal write FsummaTotal;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property techCondServRef : ENTechConditionsServicesRef read FtechCondServRef write FtechCondServRef;
    property tariffEntry1Ref : ENConnectionTariffEntryRef read FtariffEntry1Ref write FtariffEntry1Ref;
    property tariffEntry2Ref : ENConnectionTariffEntryRef read FtariffEntry2Ref write FtariffEntry2Ref;
  end;

{
  ENCalc2ConnectTariffFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fpower1Tariff : TXSDecimal;
    Ftariff1value : TXSDecimal;
    Fsumma1Tariff : TXSDecimal;
    Fpower2Tariff : TXSDecimal;
    Ftariff2value : TXSDecimal;
    Fsumma2Tariff : TXSDecimal;
    FsummaTotal : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FtechCondServRef : ENTechConditionsServicesRef;
//???
    FtariffEntry1Ref : ENConnectionTariffEntryRef;
//???
    FtariffEntry2Ref : ENConnectionTariffEntryRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property power1Tariff : TXSDecimal read Fpower1Tariff write Fpower1Tariff;
    property tariff1value : TXSDecimal read Ftariff1value write Ftariff1value;
    property summa1Tariff : TXSDecimal read Fsumma1Tariff write Fsumma1Tariff;
    property power2Tariff : TXSDecimal read Fpower2Tariff write Fpower2Tariff;
    property tariff2value : TXSDecimal read Ftariff2value write Ftariff2value;
    property summa2Tariff : TXSDecimal read Fsumma2Tariff write Fsumma2Tariff;
    property summaTotal : TXSDecimal read FsummaTotal write FsummaTotal;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property techCondServRef : ENTechConditionsServicesRef read FtechCondServRef write FtechCondServRef;
    property tariffEntry1Ref : ENConnectionTariffEntryRef read FtariffEntry1Ref write FtariffEntry1Ref;
    property tariffEntry2Ref : ENConnectionTariffEntryRef read FtariffEntry2Ref write FtariffEntry2Ref;
  end;
}

  ENCalc2ConnectTariffFilter = class(ENCalc2ConnectTariff)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENCalc2ConnectTariffShort = class(TRemotable)
  private
    Fcode : Integer;
    Fpower1Tariff : TXSDecimal;
    Ftariff1value : TXSDecimal;
    Fsumma1Tariff : TXSDecimal;
    Fpower2Tariff : TXSDecimal;
    Ftariff2value : TXSDecimal;
    Fsumma2Tariff : TXSDecimal;
    FsummaTotal : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FtechCondServRefCode : Integer;
    FtechCondServRefContractNumber : WideString;
    FtechCondServRefContractDate : TXSDate;
    FtechCondServRefFinContractNumber : WideString;
    FtechCondServRefFinContractDate : TXSDate;
    FtechCondServRefPartnerName : WideString;
    FtechCondServRefPartnerCode : WideString;
    FtechCondServRefFinDocCode : WideString;
    FtechCondServRefFinDocID : Integer;
    FtechCondServRefFinCommentGen : WideString;
    FtechCondServRefTySummaGen : TXSDecimal;
    FtechCondServRefTySummaVat : TXSDecimal;
    FtechCondServRefTyServicesSumma : TXSDecimal;
    FtechCondServRefTyServicesPower : TXSDecimal;
    FtechCondServRefCommentServicesGen : WideString;
    FtechCondServRefUserGen : WideString;
    FtechCondServRefDateEdit : TXSDate;
    FtechCondServRefCnPackCode : Integer;
    FtechCondServRefExecutionTerm : WideString;
    FtechCondServRefBuildersArea : Integer;
    FtechCondServRefBaseStation : Integer;
    FtechCondServRefSmallArchFrm : Integer;
    FtechCondServRefContractDateFinal : TXSDate;
    FtechCondServRefIsSea : Integer;
    FtechCondServRefIsDisconnectionNeeded : Integer;
    FtechCondServRefIsUse2Tariffs : Integer;
    FtariffEntry1RefCode : Integer;
    FtariffEntry1RefValue : TXSDecimal;
    FtariffEntry1RefStartDate : TXSDate;
    FtariffEntry1RefUserGen : WideString;
    FtariffEntry2RefCode : Integer;
    FtariffEntry2RefValue : TXSDecimal;
    FtariffEntry2RefStartDate : TXSDate;
    FtariffEntry2RefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property power1Tariff : TXSDecimal read Fpower1Tariff write Fpower1Tariff;
    property tariff1value : TXSDecimal read Ftariff1value write Ftariff1value;
    property summa1Tariff : TXSDecimal read Fsumma1Tariff write Fsumma1Tariff;
    property power2Tariff : TXSDecimal read Fpower2Tariff write Fpower2Tariff;
    property tariff2value : TXSDecimal read Ftariff2value write Ftariff2value;
    property summa2Tariff : TXSDecimal read Fsumma2Tariff write Fsumma2Tariff;
    property summaTotal : TXSDecimal read FsummaTotal write FsummaTotal;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property techCondServRefCode : Integer read FtechCondServRefCode write FtechCondServRefCode;
    property techCondServRefContractNumber : WideString read FtechCondServRefContractNumber write FtechCondServRefContractNumber;
    property techCondServRefContractDate : TXSDate read FtechCondServRefContractDate write FtechCondServRefContractDate;
    property techCondServRefFinContractNumber : WideString read FtechCondServRefFinContractNumber write FtechCondServRefFinContractNumber;
    property techCondServRefFinContractDate : TXSDate read FtechCondServRefFinContractDate write FtechCondServRefFinContractDate;
    property techCondServRefPartnerName : WideString read FtechCondServRefPartnerName write FtechCondServRefPartnerName;
    property techCondServRefPartnerCode : WideString read FtechCondServRefPartnerCode write FtechCondServRefPartnerCode;
    property techCondServRefFinDocCode : WideString read FtechCondServRefFinDocCode write FtechCondServRefFinDocCode;
    property techCondServRefFinDocID : Integer read FtechCondServRefFinDocID write FtechCondServRefFinDocID;
    property techCondServRefFinCommentGen : WideString read FtechCondServRefFinCommentGen write FtechCondServRefFinCommentGen;
    property techCondServRefTySummaGen : TXSDecimal read FtechCondServRefTySummaGen write FtechCondServRefTySummaGen;
    property techCondServRefTySummaVat : TXSDecimal read FtechCondServRefTySummaVat write FtechCondServRefTySummaVat;
    property techCondServRefTyServicesSumma : TXSDecimal read FtechCondServRefTyServicesSumma write FtechCondServRefTyServicesSumma;
    property techCondServRefTyServicesPower : TXSDecimal read FtechCondServRefTyServicesPower write FtechCondServRefTyServicesPower;
    property techCondServRefCommentServicesGen : WideString read FtechCondServRefCommentServicesGen write FtechCondServRefCommentServicesGen;
    property techCondServRefUserGen : WideString read FtechCondServRefUserGen write FtechCondServRefUserGen;
    property techCondServRefDateEdit : TXSDate read FtechCondServRefDateEdit write FtechCondServRefDateEdit;
    property techCondServRefCnPackCode : Integer read FtechCondServRefCnPackCode write FtechCondServRefCnPackCode;
    property techCondServRefExecutionTerm : WideString read FtechCondServRefExecutionTerm write FtechCondServRefExecutionTerm;
    property techCondServRefBuildersArea : Integer read FtechCondServRefBuildersArea write FtechCondServRefBuildersArea;
    property techCondServRefBaseStation : Integer read FtechCondServRefBaseStation write FtechCondServRefBaseStation;
    property techCondServRefSmallArchFrm : Integer read FtechCondServRefSmallArchFrm write FtechCondServRefSmallArchFrm;
    property techCondServRefContractDateFinal : TXSDate read FtechCondServRefContractDateFinal write FtechCondServRefContractDateFinal;
    property techCondServRefIsSea : Integer read FtechCondServRefIsSea write FtechCondServRefIsSea;
    property techCondServRefIsDisconnectionNeeded : Integer read FtechCondServRefIsDisconnectionNeeded write FtechCondServRefIsDisconnectionNeeded;
    property techCondServRefIsUse2Tariffs : Integer read FtechCondServRefIsUse2Tariffs write FtechCondServRefIsUse2Tariffs;
    property tariffEntry1RefCode : Integer read FtariffEntry1RefCode write FtariffEntry1RefCode;
    property tariffEntry1RefValue : TXSDecimal read FtariffEntry1RefValue write FtariffEntry1RefValue;
    property tariffEntry1RefStartDate : TXSDate read FtariffEntry1RefStartDate write FtariffEntry1RefStartDate;
    property tariffEntry1RefUserGen : WideString read FtariffEntry1RefUserGen write FtariffEntry1RefUserGen;
    property tariffEntry2RefCode : Integer read FtariffEntry2RefCode write FtariffEntry2RefCode;
    property tariffEntry2RefValue : TXSDecimal read FtariffEntry2RefValue write FtariffEntry2RefValue;
    property tariffEntry2RefStartDate : TXSDate read FtariffEntry2RefStartDate write FtariffEntry2RefStartDate;
    property tariffEntry2RefUserGen : WideString read FtariffEntry2RefUserGen write FtariffEntry2RefUserGen;
  end;

  ArrayOfENCalc2ConnectTariffShort = array of ENCalc2ConnectTariffShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCalc2ConnectTariffShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCalc2ConnectTariffShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCalc2ConnectTariffShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCalc2ConnectTariffController/message/
  // soapAction: http://ksoe.org/ENCalc2ConnectTariffController/action/ENCalc2ConnectTariffController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCalc2ConnectTariffControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCalc2ConnectTariffController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCalc2ConnectTariffControllerSoapPort = interface(IInvokable)
  ['{6E3D3997-7A3F-4B9A-B59C-79A8C69199CC}']
    function add(const aENCalc2ConnectTariff: ENCalc2ConnectTariff): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCalc2ConnectTariff: ENCalc2ConnectTariff); stdcall;
    function getObject(const anObjectCode: Integer): ENCalc2ConnectTariff; stdcall;
    function getList: ENCalc2ConnectTariffShortList; stdcall;
    function getFilteredList(const aENCalc2ConnectTariffFilter: ENCalc2ConnectTariffFilter): ENCalc2ConnectTariffShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCalc2ConnectTariffShortList; stdcall;
    function getScrollableFilteredList(const aENCalc2ConnectTariffFilter: ENCalc2ConnectTariffFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCalc2ConnectTariffShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCalc2ConnectTariffShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENCalc2ConnectTariffFilter: ENCalc2ConnectTariffFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENCalc2ConnectTariffShort; stdcall;
  end;


implementation

  destructor ENCalc2ConnectTariff.Destroy;
  begin
    if Assigned(Fpower1Tariff) then
      power1Tariff.Free;
    if Assigned(Ftariff1value) then
      tariff1value.Free;
    if Assigned(Fsumma1Tariff) then
      summa1Tariff.Free;
    if Assigned(Fpower2Tariff) then
      power2Tariff.Free;
    if Assigned(Ftariff2value) then
      tariff2value.Free;
    if Assigned(Fsumma2Tariff) then
      summa2Tariff.Free;
    if Assigned(FsummaTotal) then
      summaTotal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtechCondServRef) then
      techCondServRef.Free;
    if Assigned(FtariffEntry1Ref) then
      tariffEntry1Ref.Free;
    if Assigned(FtariffEntry2Ref) then
      tariffEntry2Ref.Free;
    inherited Destroy;
  end;

{
  destructor ENCalc2ConnectTariffFilter.Destroy;
  begin
    if Assigned(Fpower1Tariff) then
      power1Tariff.Free;
    if Assigned(Ftariff1value) then
      tariff1value.Free;
    if Assigned(Fsumma1Tariff) then
      summa1Tariff.Free;
    if Assigned(Fpower2Tariff) then
      power2Tariff.Free;
    if Assigned(Ftariff2value) then
      tariff2value.Free;
    if Assigned(Fsumma2Tariff) then
      summa2Tariff.Free;
    if Assigned(FsummaTotal) then
      summaTotal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtechCondServRef) then
      techCondServRef.Free;
    if Assigned(FtariffEntry1Ref) then
      tariffEntry1Ref.Free;
    if Assigned(FtariffEntry2Ref) then
      tariffEntry2Ref.Free;
    inherited Destroy;
  end;
}

  destructor ENCalc2ConnectTariffFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENCalc2ConnectTariffShort.Destroy;
  begin
    if Assigned(Fpower1Tariff) then
      power1Tariff.Free;
    if Assigned(Ftariff1value) then
      tariff1value.Free;
    if Assigned(Fsumma1Tariff) then
      summa1Tariff.Free;
    if Assigned(Fpower2Tariff) then
      power2Tariff.Free;
    if Assigned(Ftariff2value) then
      tariff2value.Free;
    if Assigned(Fsumma2Tariff) then
      summa2Tariff.Free;
    if Assigned(FsummaTotal) then
      summaTotal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtechCondServRefContractDate) then
      techCondServRefContractDate.Free;
    if Assigned(FtechCondServRefFinContractDate) then
      techCondServRefFinContractDate.Free;
    if Assigned(FtechCondServRefTySummaGen) then
      techCondServRefTySummaGen.Free;
    if Assigned(FtechCondServRefTySummaVat) then
      techCondServRefTySummaVat.Free;
    if Assigned(FtechCondServRefTyServicesSumma) then
      techCondServRefTyServicesSumma.Free;
    if Assigned(FtechCondServRefTyServicesPower) then
      techCondServRefTyServicesPower.Free;
    if Assigned(FtechCondServRefDateEdit) then
      techCondServRefDateEdit.Free;
    if Assigned(FtechCondServRefContractDateFinal) then
      techCondServRefContractDateFinal.Free;
    if Assigned(FtariffEntry1RefValue) then
      tariffEntry1RefValue.Free;
    if Assigned(FtariffEntry1RefStartDate) then
      tariffEntry1RefStartDate.Free;
    if Assigned(FtariffEntry2RefValue) then
      tariffEntry2RefValue.Free;
    if Assigned(FtariffEntry2RefStartDate) then
      tariffEntry2RefStartDate.Free;
    inherited Destroy;
  end;

  destructor ENCalc2ConnectTariffShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCalc2ConnectTariff, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalc2ConnectTariff');
  RemClassRegistry.RegisterXSClass(ENCalc2ConnectTariffRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalc2ConnectTariffRef');
  RemClassRegistry.RegisterXSClass(ENCalc2ConnectTariffFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalc2ConnectTariffFilter');
  RemClassRegistry.RegisterXSClass(ENCalc2ConnectTariffShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalc2ConnectTariffShort');
  RemClassRegistry.RegisterXSClass(ENCalc2ConnectTariffShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalc2ConnectTariffShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCalc2ConnectTariffShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCalc2ConnectTariffShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCalc2ConnectTariffControllerSoapPort), 'http://ksoe.org/ENCalc2ConnectTariffController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCalc2ConnectTariffControllerSoapPort), 'http://ksoe.org/ENCalc2ConnectTariffController/action/ENCalc2ConnectTariffController.%operationName%');


end.
