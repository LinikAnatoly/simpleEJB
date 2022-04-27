unit ENAgreeJointController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENLine10Controller 
   ,ENLineCableController 
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

  ENAgreeJoint            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAgreeJointRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAgreeJoint = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FagreeNum : WideString;
    FagreeDate : TXSDate;
    FbalanceLim : WideString;
    Fmodify_time : Int64;
    Fdomain_info : WideString;
//???
    Fline10Ref : ENLine10Ref;
//???
    FlineCableRef : ENLineCableRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property agreeNum : WideString read FagreeNum write FagreeNum;
    property agreeDate : TXSDate read FagreeDate write FagreeDate;
    property balanceLim : WideString read FbalanceLim write FbalanceLim;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property lineCableRef : ENLineCableRef read FlineCableRef write FlineCableRef; 
  end;
  
{
  ENAgreeJointFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FagreeNum : WideString;
    FagreeDate : TXSDate;
    FbalanceLim : WideString;
    Fmodify_time : Int64;
    Fdomain_info : WideString;
//???
    Fline10Ref : ENLine10Ref;
//???
    FlineCableRef : ENLineCableRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property agreeNum : WideString read FagreeNum write FagreeNum;
    property agreeDate : TXSDate read FagreeDate write FagreeDate;
    property balanceLim : WideString read FbalanceLim write FbalanceLim;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property lineCableRef : ENLineCableRef read FlineCableRef write FlineCableRef; 
  end;
}

  ENAgreeJointFilter = class(ENAgreeJoint)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENAgreeJointShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FagreeNum : WideString;
    FagreeDate : TXSDate;	
    FbalanceLim : WideString;
    Fline10RefCode : Integer; 
    Fline10RefInvNumber : WideString;
    Fline10RefName : WideString;
    Fline10RefBuhName : WideString;
    Fline10RefLineLength : TXSDecimal;
    Fline10RefYearBuild : Integer; 
    Fline10RefYearWorkingStart : Integer; 
    Fline10RefLastRepairDate : TXSDate;
    FlineCableRefCode : Integer; 
    FlineCableRefInvNumber : WideString;
    FlineCableRefName : WideString;
    FlineCableRefBuhName : WideString;
    FlineCableRefLineLength : TXSDecimal;
    FlineCableRefYearBuild : Integer; 
    FlineCableRefYearWorkingStart : Integer; 
    FlineCableRefLastRepairDate : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property agreeNum : WideString read FagreeNum write FagreeNum;
    property agreeDate : TXSDate read FagreeDate write FagreeDate;
    property balanceLim : WideString read FbalanceLim write FbalanceLim;

    property line10RefCode : Integer read Fline10RefCode write Fline10RefCode; 
    property line10RefInvNumber : WideString read Fline10RefInvNumber write Fline10RefInvNumber; 
    property line10RefName : WideString read Fline10RefName write Fline10RefName; 
    property line10RefBuhName : WideString read Fline10RefBuhName write Fline10RefBuhName; 
    property line10RefLineLength : TXSDecimal read Fline10RefLineLength write Fline10RefLineLength; 
    property line10RefYearBuild : Integer read Fline10RefYearBuild write Fline10RefYearBuild; 
    property line10RefYearWorkingStart : Integer read Fline10RefYearWorkingStart write Fline10RefYearWorkingStart; 
    property line10RefLastRepairDate : TXSDate read Fline10RefLastRepairDate write Fline10RefLastRepairDate; 
    property lineCableRefCode : Integer read FlineCableRefCode write FlineCableRefCode; 
    property lineCableRefInvNumber : WideString read FlineCableRefInvNumber write FlineCableRefInvNumber; 
    property lineCableRefName : WideString read FlineCableRefName write FlineCableRefName; 
    property lineCableRefBuhName : WideString read FlineCableRefBuhName write FlineCableRefBuhName; 
    property lineCableRefLineLength : TXSDecimal read FlineCableRefLineLength write FlineCableRefLineLength; 
    property lineCableRefYearBuild : Integer read FlineCableRefYearBuild write FlineCableRefYearBuild; 
    property lineCableRefYearWorkingStart : Integer read FlineCableRefYearWorkingStart write FlineCableRefYearWorkingStart; 
    property lineCableRefLastRepairDate : TXSDate read FlineCableRefLastRepairDate write FlineCableRefLastRepairDate; 
  end;

  ArrayOfENAgreeJointShort = array of ENAgreeJointShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAgreeJointShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAgreeJointShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAgreeJointShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAgreeJointController/message/
  // soapAction: http://ksoe.org/ENAgreeJointController/action/ENAgreeJointController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAgreeJointControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAgreeJointController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAgreeJointControllerSoapPort = interface(IInvokable)
  ['{95f295f2-95f2-95f2-95f2-95f295f295f2}']
    function  add(const aENAgreeJoint: ENAgreeJoint): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAgreeJoint: ENAgreeJoint); stdcall;
    function  getObject(const anObjectCode: Integer): ENAgreeJoint; stdcall;
    function  getList: ENAgreeJointShortList; stdcall;
    function  getFilteredList(const aENAgreeJointFilter: ENAgreeJointFilter): ENAgreeJointShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAgreeJointShortList; stdcall;
    function  getScrollableFilteredList(const aENAgreeJointFilter: ENAgreeJointFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAgreeJointShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAgreeJointShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENAgreeJointFilter: ENAgreeJointFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENAgreeJoint.Destroy;
  begin
    if Assigned(FagreeDate) then
      agreeDate.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(FlineCableRef) then
      lineCableRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENAgreeJointFilter.Destroy;
  begin
    if Assigned(FagreeDate) then
      agreeDate.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(FlineCableRef) then
      lineCableRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENAgreeJointFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENAgreeJointShort.Destroy;
  begin
    if Assigned(FagreeDate) then
      agreeDate.Free;
    if Assigned(Fline10RefLineLength) then
      line10RefLineLength.Free;
    if Assigned(Fline10RefLastRepairDate) then
      line10RefLastRepairDate.Free;
    if Assigned(FlineCableRefLineLength) then
      lineCableRefLineLength.Free;
    if Assigned(FlineCableRefLastRepairDate) then
      lineCableRefLastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENAgreeJointShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAgreeJoint, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAgreeJoint');
  RemClassRegistry.RegisterXSClass(ENAgreeJointRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAgreeJointRef');
  RemClassRegistry.RegisterXSClass(ENAgreeJointFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAgreeJointFilter');
  RemClassRegistry.RegisterXSClass(ENAgreeJointShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAgreeJointShort');
  RemClassRegistry.RegisterXSClass(ENAgreeJointShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAgreeJointShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAgreeJointShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAgreeJointShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAgreeJointControllerSoapPort), 'http://ksoe.org/ENAgreeJointController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAgreeJointControllerSoapPort), 'http://ksoe.org/ENAgreeJointController/action/ENAgreeJointController.%operationName%');


end.
