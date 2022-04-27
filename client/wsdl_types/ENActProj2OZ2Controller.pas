unit ENActProj2OZ2Controller;

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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  ENActProj2OZ2            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActProj2OZ2Ref = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActProj2OZ2 = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FcommentGen : WideString;
    FsummaGen : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FENReconstrModernOZRef : ENReconstrModernOZRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property ENReconstrModernOZRef : ENReconstrModernOZRef read FENReconstrModernOZRef write FENReconstrModernOZRef;
  end;

{
  ENActProj2OZ2Filter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FcommentGen : WideString;
    FsummaGen : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FENReconstrModernOZRef : ENReconstrModernOZRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property ENReconstrModernOZRef : ENReconstrModernOZRef read FENReconstrModernOZRef write FENReconstrModernOZRef;
  end;
}

  ENActProj2OZ2Filter = class(ENActProj2OZ2)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENActProj2OZ2Short = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FsummaGen : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FENReconstrModernOZRefCode : Integer;
    FENReconstrModernOZRefNumbergen : WideString;
    FENReconstrModernOZRefDateGen : TXSDate;
    FENReconstrModernOZRefDateEdit : TXSDate;
    FENReconstrModernOZRefSummaGen : TXSDecimal;
    FENReconstrModernOZRefSummaNDS : TXSDecimal;
    FENReconstrModernOZRefCharacteristic : WideString;
    FENReconstrModernOZRefExecutedPosition : WideString;
    FENReconstrModernOZRefExecutedName : WideString;
    FENReconstrModernOZRefAcceptedPosition : WideString;
    FENReconstrModernOZRefAcceptedName : WideString;
    FENReconstrModernOZRefContractPrice : TXSDecimal;
    FENReconstrModernOZRefCodeMol : WideString;
    FENReconstrModernOZRefCodePodr : WideString;
    FENReconstrModernOZRefInvNumberOZ : WideString;
    FENReconstrModernOZRefNameOZ : WideString;
    FENReconstrModernOZRefFinContractNumber : WideString;
    FENReconstrModernOZRefFinContractDate : TXSDate;
    FENReconstrModernOZRefPartnerName : WideString;
    FENReconstrModernOZRefPartnerCode : WideString;
    FENReconstrModernOZRefCharacteristicOS : WideString;
    FENReconstrModernOZRefIsInvestProgram : Integer;
    FENReconstrModernOZRefYearInvestProgram : WideString;
    FENReconstrModernOZRefItemInvestProgram : WideString;
    FENReconstrModernOZRefTypeRM : Integer;
    FENReconstrModernOZRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property ENReconstrModernOZRefCode : Integer read FENReconstrModernOZRefCode write FENReconstrModernOZRefCode;
    property ENReconstrModernOZRefNumbergen : WideString read FENReconstrModernOZRefNumbergen write FENReconstrModernOZRefNumbergen;
    property ENReconstrModernOZRefDateGen : TXSDate read FENReconstrModernOZRefDateGen write FENReconstrModernOZRefDateGen;
    property ENReconstrModernOZRefDateEdit : TXSDate read FENReconstrModernOZRefDateEdit write FENReconstrModernOZRefDateEdit;
    property ENReconstrModernOZRefSummaGen : TXSDecimal read FENReconstrModernOZRefSummaGen write FENReconstrModernOZRefSummaGen;
    property ENReconstrModernOZRefSummaNDS : TXSDecimal read FENReconstrModernOZRefSummaNDS write FENReconstrModernOZRefSummaNDS;
    property ENReconstrModernOZRefCharacteristic : WideString read FENReconstrModernOZRefCharacteristic write FENReconstrModernOZRefCharacteristic;
    property ENReconstrModernOZRefExecutedPosition : WideString read FENReconstrModernOZRefExecutedPosition write FENReconstrModernOZRefExecutedPosition;
    property ENReconstrModernOZRefExecutedName : WideString read FENReconstrModernOZRefExecutedName write FENReconstrModernOZRefExecutedName;
    property ENReconstrModernOZRefAcceptedPosition : WideString read FENReconstrModernOZRefAcceptedPosition write FENReconstrModernOZRefAcceptedPosition;
    property ENReconstrModernOZRefAcceptedName : WideString read FENReconstrModernOZRefAcceptedName write FENReconstrModernOZRefAcceptedName;
    property ENReconstrModernOZRefContractPrice : TXSDecimal read FENReconstrModernOZRefContractPrice write FENReconstrModernOZRefContractPrice;
    property ENReconstrModernOZRefCodeMol : WideString read FENReconstrModernOZRefCodeMol write FENReconstrModernOZRefCodeMol;
    property ENReconstrModernOZRefCodePodr : WideString read FENReconstrModernOZRefCodePodr write FENReconstrModernOZRefCodePodr;
    property ENReconstrModernOZRefInvNumberOZ : WideString read FENReconstrModernOZRefInvNumberOZ write FENReconstrModernOZRefInvNumberOZ;
    property ENReconstrModernOZRefNameOZ : WideString read FENReconstrModernOZRefNameOZ write FENReconstrModernOZRefNameOZ;
    property ENReconstrModernOZRefFinContractNumber : WideString read FENReconstrModernOZRefFinContractNumber write FENReconstrModernOZRefFinContractNumber;
    property ENReconstrModernOZRefFinContractDate : TXSDate read FENReconstrModernOZRefFinContractDate write FENReconstrModernOZRefFinContractDate;
    property ENReconstrModernOZRefPartnerName : WideString read FENReconstrModernOZRefPartnerName write FENReconstrModernOZRefPartnerName;
    property ENReconstrModernOZRefPartnerCode : WideString read FENReconstrModernOZRefPartnerCode write FENReconstrModernOZRefPartnerCode;
    property ENReconstrModernOZRefCharacteristicOS : WideString read FENReconstrModernOZRefCharacteristicOS write FENReconstrModernOZRefCharacteristicOS;
    property ENReconstrModernOZRefIsInvestProgram : Integer read FENReconstrModernOZRefIsInvestProgram write FENReconstrModernOZRefIsInvestProgram;
    property ENReconstrModernOZRefYearInvestProgram : WideString read FENReconstrModernOZRefYearInvestProgram write FENReconstrModernOZRefYearInvestProgram;
    property ENReconstrModernOZRefItemInvestProgram : WideString read FENReconstrModernOZRefItemInvestProgram write FENReconstrModernOZRefItemInvestProgram;
    property ENReconstrModernOZRefTypeRM : Integer read FENReconstrModernOZRefTypeRM write FENReconstrModernOZRefTypeRM;
    property ENReconstrModernOZRefUserGen : WideString read FENReconstrModernOZRefUserGen write FENReconstrModernOZRefUserGen;
  end;

  ArrayOfENActProj2OZ2Short = array of ENActProj2OZ2Short;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActProj2OZ2ShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActProj2OZ2Short;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActProj2OZ2Short read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActProj2OZ2Controller/message/
  // soapAction: http://ksoe.org/ENActProj2OZ2Controller/action/ENActProj2OZ2Controller.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActProj2OZ2ControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActProj2OZ2Controller
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActProj2OZ2ControllerSoapPort = interface(IInvokable)
  ['{1e131e13-1e13-1e13-1e13-1e131e131e13}']
    function add(const aENActProj2OZ2: ENActProj2OZ2): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActProj2OZ2: ENActProj2OZ2); stdcall;
    function getObject(const anObjectCode: Integer): ENActProj2OZ2; stdcall;
    function getList: ENActProj2OZ2ShortList; stdcall;
    function getFilteredList(const aENActProj2OZ2Filter: ENActProj2OZ2Filter): ENActProj2OZ2ShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActProj2OZ2ShortList; stdcall;
    function getScrollableFilteredList(const aENActProj2OZ2Filter: ENActProj2OZ2Filter; const aFromPosition: Integer; const aQuantity: Integer): ENActProj2OZ2ShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActProj2OZ2ShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENActProj2OZ2Filter: ENActProj2OZ2Filter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActProj2OZ2Short; stdcall;
  end;


implementation

  destructor ENActProj2OZ2.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FENReconstrModernOZRef) then
      ENReconstrModernOZRef.Free;
    inherited Destroy;
  end;

{
  destructor ENActProj2OZ2Filter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FENReconstrModernOZRef) then
      ENReconstrModernOZRef.Free;
    inherited Destroy;
  end;
}

  destructor ENActProj2OZ2Filter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENActProj2OZ2Short.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FENReconstrModernOZRefDateGen) then
      ENReconstrModernOZRefDateGen.Free;
    if Assigned(FENReconstrModernOZRefDateEdit) then
      ENReconstrModernOZRefDateEdit.Free;
    if Assigned(FENReconstrModernOZRefSummaGen) then
      ENReconstrModernOZRefSummaGen.Free;
    if Assigned(FENReconstrModernOZRefSummaNDS) then
      ENReconstrModernOZRefSummaNDS.Free;
    if Assigned(FENReconstrModernOZRefContractPrice) then
      ENReconstrModernOZRefContractPrice.Free;
    if Assigned(FENReconstrModernOZRefFinContractDate) then
      ENReconstrModernOZRefFinContractDate.Free;
    inherited Destroy;
  end;

  destructor ENActProj2OZ2ShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActProj2OZ2, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActProj2OZ2');
  RemClassRegistry.RegisterXSClass(ENActProj2OZ2Ref, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActProj2OZ2Ref');
  RemClassRegistry.RegisterXSClass(ENActProj2OZ2Filter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActProj2OZ2Filter');
  RemClassRegistry.RegisterXSClass(ENActProj2OZ2Short, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActProj2OZ2Short');
  RemClassRegistry.RegisterXSClass(ENActProj2OZ2ShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActProj2OZ2ShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActProj2OZ2Short), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActProj2OZ2Short');

  InvRegistry.RegisterInterface(TypeInfo(ENActProj2OZ2ControllerSoapPort), 'http://ksoe.org/ENActProj2OZ2Controller/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActProj2OZ2ControllerSoapPort), 'http://ksoe.org/ENActProj2OZ2Controller/action/ENActProj2OZ2Controller.%operationName%');


end.
