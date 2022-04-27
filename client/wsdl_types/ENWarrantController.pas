unit ENWarrantController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
   , ENDepartmentController
   , ENWarrantStatusController
   , ENWarrantTypeController
   , ENDocAttachmentController
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

  ENWarrant            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWarrantRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWarrant = class(TRemotable)
  private
    Fcode : Integer;
    Fnumbergen : WideString;
    Fname : WideString;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FwarrantFIO : WideString;
    FwarrantShortFIO : WideString;
    FwarrantPosition : WideString;
    FgenitiveFIO : WideString;
    FgenitivePosition : WideString;
    FpersonSurname : WideString;
    FpersonSurnameGenitive : WideString;
    FpersonName : WideString;
    FpersonNameGenitive : WideString;
    FpersonPatronimic : WideString;
    FpersonPatronimicGenitive : WideString;
    Fpassport : WideString;
    Faddress : WideString;
    FdateGen : TXSDate;
    Fpower : Integer;
    FmaxSum : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
FdepartmentName : WideString;
    FdepartmentNameGenitive : WideString;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FwarrantStatusRef : ENWarrantStatusRef;
//???
    FwarrantTypeRef : ENWarrantTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property name : WideString read Fname write Fname;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property warrantFIO : WideString read FwarrantFIO write FwarrantFIO;
    property warrantShortFIO : WideString read FwarrantShortFIO write FwarrantShortFIO;
    property warrantPosition : WideString read FwarrantPosition write FwarrantPosition;
    property genitiveFIO : WideString read FgenitiveFIO write FgenitiveFIO;
    property genitivePosition : WideString read FgenitivePosition write FgenitivePosition;
    property personSurname : WideString read FpersonSurname write FpersonSurname;
    property personSurnameGenitive : WideString read FpersonSurnameGenitive write FpersonSurnameGenitive;
    property personName : WideString read FpersonName write FpersonName;
    property personNameGenitive : WideString read FpersonNameGenitive write FpersonNameGenitive;
    property personPatronimic : WideString read FpersonPatronimic write FpersonPatronimic;
    property personPatronimicGenitive : WideString read FpersonPatronimicGenitive write FpersonPatronimicGenitive;
    property passport : WideString read Fpassport write Fpassport;
    property address : WideString read Faddress write Faddress;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property  power : Integer read Fpower write Fpower;
    property maxSum : TXSDecimal read FmaxSum write FmaxSum;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property departmentName : WideString read FdepartmentName write FdepartmentName;
    property departmentNameGenitive : WideString read FdepartmentNameGenitive write FdepartmentNameGenitive;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property warrantStatusRef : ENWarrantStatusRef read FwarrantStatusRef write FwarrantStatusRef;
    property warrantTypeRef : ENWarrantTypeRef read FwarrantTypeRef write FwarrantTypeRef;
  end;

{
  ENWarrantFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fnumbergen : WideString;
    Fname : WideString;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FwarrantFIO : WideString;
    FwarrantShortFIO : WideString;
    FwarrantPosition : WideString;
    FgenitiveFIO : WideString;
    FgenitivePosition : WideString;
    Fpassport : WideString;
    Faddress : WideString;
    FdateGen : TXSDate;
    Fpower : Integer;
    FmaxSum : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
 FdepartmentName : WideString;
    FdepartmentNameGenitive : WideString;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FwarrantStatusRef : ENWarrantStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property name : WideString read Fname write Fname;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property warrantFIO : WideString read FwarrantFIO write FwarrantFIO;
    property warrantShortFIO : WideString read FwarrantShortFIO write FwarrantShortFIO;
    property warrantPosition : WideString read FwarrantPosition write FwarrantPosition;
    property genitiveFIO : WideString read FgenitiveFIO write FgenitiveFIO;
    property genitivePosition : WideString read FgenitivePosition write FgenitivePosition;
    property passport : WideString read Fpassport write Fpassport;
    property address : WideString read Faddress write Faddress;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property  power : Integer read Fpower write Fpower;
    property maxSum : TXSDecimal read FmaxSum write FmaxSum;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
property departmentName : WideString read FdepartmentName write FdepartmentName;
    property departmentNameGenitive : WideString read FdepartmentNameGenitive write FdepartmentNameGenitive;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property warrantStatusRef : ENWarrantStatusRef read FwarrantStatusRef write FwarrantStatusRef;
  end;
}

  ENWarrantFilter = class(ENWarrant)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENWarrantShort = class(TRemotable)
  private
    Fcode : Integer;
    Fnumbergen : WideString;
    Fname : WideString;
    FwarrantFIO : WideString;
    FwarrantShortFIO : WideString;
    FwarrantPosition : WideString;
    FgenitiveFIO : WideString;
    FgenitivePosition : WideString;
    Fpassport : WideString;
    Faddress : WideString;
    Fpower : Integer;
    FmaxSum : TXSDecimal;
    FdepartmentName : WideString;
    FdepartmentNameGenitive : WideString;
    FdepartmentRefCode : Integer;
    FdepartmentRefShortName : WideString;
    FdepartmentRefDateStart : TXSDate;
    FdepartmentRefDateFinal : TXSDate;
    FdepartmentRefRenCode : Integer;
    FdepartmentRefShpzBalans : WideString;
    FdepartmentRefKau_table_id_1884 : Integer;
    FdepartmentRefKau_1884 : WideString;
    FdepartmentRefName_1884 : WideString;
    FdepartmentRefHrmorganizationid : WideString;
    FwarrantStatusRefCode : Integer;
    FwarrantStatusRefName : WideString;
    FdateGen : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property name : WideString read Fname write Fname;
    property warrantFIO : WideString read FwarrantFIO write FwarrantFIO;
    property warrantShortFIO : WideString read FwarrantShortFIO write FwarrantShortFIO;
    property warrantPosition : WideString read FwarrantPosition write FwarrantPosition;
    property genitiveFIO : WideString read FgenitiveFIO write FgenitiveFIO;
    property genitivePosition : WideString read FgenitivePosition write FgenitivePosition;
    property passport : WideString read Fpassport write Fpassport;
    property address : WideString read Faddress write Faddress;
    property  power : Integer read Fpower write Fpower;
    property maxSum : TXSDecimal read FmaxSum write FmaxSum;
    property departmentName : WideString read FdepartmentName write FdepartmentName;
    property departmentNameGenitive : WideString read FdepartmentNameGenitive write FdepartmentNameGenitive;

    property departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode;
    property departmentRefShortName : WideString read FdepartmentRefShortName write FdepartmentRefShortName;
    property departmentRefDateStart : TXSDate read FdepartmentRefDateStart write FdepartmentRefDateStart;
    property departmentRefDateFinal : TXSDate read FdepartmentRefDateFinal write FdepartmentRefDateFinal;
    property departmentRefRenCode : Integer read FdepartmentRefRenCode write FdepartmentRefRenCode;
    property departmentRefShpzBalans : WideString read FdepartmentRefShpzBalans write FdepartmentRefShpzBalans;
    property departmentRefKau_table_id_1884 : Integer read FdepartmentRefKau_table_id_1884 write FdepartmentRefKau_table_id_1884;
    property departmentRefKau_1884 : WideString read FdepartmentRefKau_1884 write FdepartmentRefKau_1884;
    property departmentRefName_1884 : WideString read FdepartmentRefName_1884 write FdepartmentRefName_1884;
    property departmentRefHrmorganizationid : WideString read FdepartmentRefHrmorganizationid write FdepartmentRefHrmorganizationid;
    property warrantStatusRefCode : Integer read FwarrantStatusRefCode write FwarrantStatusRefCode;
    property warrantStatusRefName : WideString read FwarrantStatusRefName write FwarrantStatusRefName;
    property dateGen : TXSDate read FdateGen write FdateGen;
  end;

  ArrayOfENWarrantShort = array of ENWarrantShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENWarrantShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWarrantShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWarrantShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWarrantController/message/
  // soapAction: http://ksoe.org/ENWarrantController/action/ENWarrantController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWarrantControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWarrantController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWarrantControllerSoapPort = interface(IInvokable)
  ['{8A1F7B24-220C-4E00-A08A-40E4834B6AC1}']
    function add(const aENWarrant: ENWarrant): Integer; stdcall; overload;

    function add(const aENWarrant: ENWarrant;
      const aDFDocAttachment: ENDocAttachment;
      const aFile: ArrayOfByte;
      const fileName: WideString): Integer; stdcall; overload;

    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENWarrant: ENWarrant); stdcall;
    function getObject(const anObjectCode: Integer): ENWarrant; stdcall;
    function getList: ENWarrantShortList; stdcall;
    function getFilteredList(const aENWarrantFilter: ENWarrantFilter): ENWarrantShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWarrantShortList; stdcall;
    function getScrollableFilteredList(const aENWarrantFilter: ENWarrantFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWarrantShortList; stdcall; overload;
    function getScrollableFilteredList(const aENWarrantFilter: ENWarrantFilter; const aFromPosition: Integer; const aQuantity: Integer; const typeCode : Integer): ENWarrantShortList; stdcall; overload;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWarrantShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENWarrantFilter: ENWarrantFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENWarrantShort; stdcall;

    //** »зменить доверенность на не черновом договоре */
	  procedure changeWarrant(const servicesObjectCode: Integer; const warrantCode: Integer); stdcall;
  end;


implementation

  destructor ENWarrant.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FmaxSum) then
      maxSum.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FwarrantStatusRef) then
      warrantStatusRef.Free;
    if Assigned(FwarrantTypeRef) then
      warrantTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENWarrantFilter.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FmaxSum) then
      maxSum.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FwarrantStatusRef) then
      warrantStatusRef.Free;
    if Assigned(FwarrantTypeRef) then
      warrantTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENWarrantFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENWarrantShort.Destroy;
  begin
    if Assigned(FmaxSum) then
      maxSum.Free;
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    inherited Destroy;
  end;

  destructor ENWarrantShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWarrant, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrant');
  RemClassRegistry.RegisterXSClass(ENWarrantRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrantRef');
  RemClassRegistry.RegisterXSClass(ENWarrantFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrantFilter');
  RemClassRegistry.RegisterXSClass(ENWarrantShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrantShort');
  RemClassRegistry.RegisterXSClass(ENWarrantShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrantShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWarrantShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWarrantShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWarrantControllerSoapPort), 'http://ksoe.org/ENWarrantController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWarrantControllerSoapPort), 'http://ksoe.org/ENWarrantController/action/ENWarrantController.%operationName%');


end.
