unit ENServicesFromSideObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
   ,ENDepartmentController
   ,ENElementController
   ,ENGeneralContractsController
   ,ENServFromSideStatusController
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

  ENServicesFromSideObject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesFromSideObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesFromSideObject = class(TRemotable)
  private
    Fcode : Integer;
    FnumberProject : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    Fname : WideString;
    FpartnerCode : WideString;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fdepartment : ENDepartment;
//???
    Felement : ENElement;
//???
    FgeneralContractRef : ENGeneralContractsRef;

    FstatusRef : ENServFromSideStatusRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property name : WideString read Fname write Fname;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property department : ENDepartment read Fdepartment write Fdepartment;
    property element : ENElement read Felement write Felement;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
    property statusRef : ENServFromSideStatusRef read FstatusRef write FstatusRef;
  end;

{
  ENServicesFromSideObjectFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberProject : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    Fname : WideString;
    FpartnerCode : WideString;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fdepartment : ENDepartment;
//???
    Felement : ENElement;
//???
    FgeneralContractRef : ENGeneralContractsRef;
    FstatusRef : ENServFromSideStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property name : WideString read Fname write Fname;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property department : ENDepartment read Fdepartment write Fdepartment;
    property element : ENElement read Felement write Felement;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
    property statusRef : ENServFromSideStatusRef read FstatusRef write FstatusRef;
  end;
}

  ENServicesFromSideObjectFilter = class(ENServicesFromSideObject)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENServicesFromSideObjectShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberProject : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    Fname : WideString;
    FpartnerCode : WideString;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FdepartmentCode : Integer;
    FdepartmentShortName : WideString;
    FdepartmentDateStart : TXSDate;
    FdepartmentDateFinal : TXSDate;
    FdepartmentRenCode : Integer;
    FdepartmentShpzBalans : WideString;
    FdepartmentKau_table_id_1884 : Integer;
    FdepartmentKau_1884 : WideString;
    FdepartmentName_1884 : WideString;
    FdepartmentHrmorganizationid : WideString;
    FelementCode : Integer;
    FgeneralContractRefCode : Integer;
    FgeneralContractRefFinDocID : Integer;
    FgeneralContractRefFinDocCode : WideString;
    FgeneralContractRefContractNumber : WideString;
    FgeneralContractRefContractDate : TXSDate;
    FgeneralContractRefCommentGen : WideString;
    FgeneralContractRefPartnerId : Integer;
    FgeneralContractRefPartnerCode : WideString;
    FgeneralContractRefPartnerName : WideString;
    FgeneralContractRefContractRegDate : TXSDate;
    FgeneralContractRefContractStartDate : TXSDate;
    FgeneralContractRefContractEndDate : TXSDate;
    FgeneralContractRefAxContractId : WideString;
    FgeneralContractRefAxContractCode : WideString;
    FgeneralContractRefAxContractNumber : WideString;
    FgeneralContractRefAxContractAccount : WideString;
    FgeneralContractRefAxContractDate : TXSDate;
    FgeneralContractRefAxContractCommentGen : WideString;
    FgeneralContractRefAxContractGroupCode : WideString;
    FgeneralContractRefAxPartnerCode : WideString;
    FgeneralContractRefAxPartnerName : WideString;
    FgeneralContractRefUserGen : WideString;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;

    Fbill_sum : TXSDecimal;
    Fpay_sum : TXSDecimal;

  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property name : WideString read Fname write Fname;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property departmentCode : Integer read FdepartmentCode write FdepartmentCode;
    property departmentShortName : WideString read FdepartmentShortName write FdepartmentShortName;
    property departmentDateStart : TXSDate read FdepartmentDateStart write FdepartmentDateStart;
    property departmentDateFinal : TXSDate read FdepartmentDateFinal write FdepartmentDateFinal;
    property departmentRenCode : Integer read FdepartmentRenCode write FdepartmentRenCode;
    property departmentShpzBalans : WideString read FdepartmentShpzBalans write FdepartmentShpzBalans;
    property departmentKau_table_id_1884 : Integer read FdepartmentKau_table_id_1884 write FdepartmentKau_table_id_1884;
    property departmentKau_1884 : WideString read FdepartmentKau_1884 write FdepartmentKau_1884;
    property departmentName_1884 : WideString read FdepartmentName_1884 write FdepartmentName_1884;
    property departmentHrmorganizationid : WideString read FdepartmentHrmorganizationid write FdepartmentHrmorganizationid;
    property elementCode : Integer read FelementCode write FelementCode;
    property generalContractRefCode : Integer read FgeneralContractRefCode write FgeneralContractRefCode;
    property generalContractRefFinDocID : Integer read FgeneralContractRefFinDocID write FgeneralContractRefFinDocID;
    property generalContractRefFinDocCode : WideString read FgeneralContractRefFinDocCode write FgeneralContractRefFinDocCode;
    property generalContractRefContractNumber : WideString read FgeneralContractRefContractNumber write FgeneralContractRefContractNumber;
    property generalContractRefContractDate : TXSDate read FgeneralContractRefContractDate write FgeneralContractRefContractDate;
    property generalContractRefCommentGen : WideString read FgeneralContractRefCommentGen write FgeneralContractRefCommentGen;
    property generalContractRefPartnerId : Integer read FgeneralContractRefPartnerId write FgeneralContractRefPartnerId;
    property generalContractRefPartnerCode : WideString read FgeneralContractRefPartnerCode write FgeneralContractRefPartnerCode;
    property generalContractRefPartnerName : WideString read FgeneralContractRefPartnerName write FgeneralContractRefPartnerName;
    property generalContractRefContractRegDate : TXSDate read FgeneralContractRefContractRegDate write FgeneralContractRefContractRegDate;
    property generalContractRefContractStartDate : TXSDate read FgeneralContractRefContractStartDate write FgeneralContractRefContractStartDate;
    property generalContractRefContractEndDate : TXSDate read FgeneralContractRefContractEndDate write FgeneralContractRefContractEndDate;
    property generalContractRefAxContractId : WideString read FgeneralContractRefAxContractId write FgeneralContractRefAxContractId;
    property generalContractRefAxContractCode : WideString read FgeneralContractRefAxContractCode write FgeneralContractRefAxContractCode;
    property generalContractRefAxContractNumber : WideString read FgeneralContractRefAxContractNumber write FgeneralContractRefAxContractNumber;
    property generalContractRefAxContractAccount : WideString read FgeneralContractRefAxContractAccount write FgeneralContractRefAxContractAccount;
    property generalContractRefAxContractDate : TXSDate read FgeneralContractRefAxContractDate write FgeneralContractRefAxContractDate;
    property generalContractRefAxContractCommentGen : WideString read FgeneralContractRefAxContractCommentGen write FgeneralContractRefAxContractCommentGen;
    property generalContractRefAxContractGroupCode : WideString read FgeneralContractRefAxContractGroupCode write FgeneralContractRefAxContractGroupCode;
    property generalContractRefAxPartnerCode : WideString read FgeneralContractRefAxPartnerCode write FgeneralContractRefAxPartnerCode;
    property generalContractRefAxPartnerName : WideString read FgeneralContractRefAxPartnerName write FgeneralContractRefAxPartnerName;
    property generalContractRefUserGen : WideString read FgeneralContractRefUserGen write FgeneralContractRefUserGen;
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property bill_sum : TXSDecimal read Fbill_sum write Fbill_sum;
    property pay_sum : TXSDecimal read Fpay_sum write Fpay_sum;
  end;

  ArrayOfENServicesFromSideObjectShort = array of ENServicesFromSideObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServicesFromSideObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServicesFromSideObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServicesFromSideObjectShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServicesFromSideObjectController/message/
  // soapAction: http://ksoe.org/ENServicesFromSideObjectController/action/ENServicesFromSideObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServicesFromSideObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServicesFromSideObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServicesFromSideObjectControllerSoapPort = interface(IInvokable)
  ['{57343FEC-AD69-4241-9E8F-B755D420FC7D}']
    function add(const aENServicesFromSideObject: ENServicesFromSideObject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENServicesFromSideObject: ENServicesFromSideObject); stdcall;
    function getObject(const anObjectCode: Integer): ENServicesFromSideObject; stdcall;
    function getList: ENServicesFromSideObjectShortList; stdcall;
    function getFilteredList(const aENServicesFromSideObjectFilter: ENServicesFromSideObjectFilter): ENServicesFromSideObjectShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServicesFromSideObjectShortList; stdcall;
    function getScrollableFilteredList(const aENServicesFromSideObjectFilter: ENServicesFromSideObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServicesFromSideObjectShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServicesFromSideObjectShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENServicesFromSideObjectFilter: ENServicesFromSideObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENServicesFromSideObjectShort; stdcall;


    function signed(const code : Integer): Integer; overload; stdcall;
    function unSigned(const code : Integer): Integer; overload; stdcall;
    function pay(const code : Integer): Integer; overload; stdcall;
    function unPay(const code : Integer): Integer; overload; stdcall;
    function workExecuted(const code : Integer): Integer; overload; stdcall;
    function workUnExecuted(const code : Integer): Integer; overload; stdcall;
    function workCompleted(const code : Integer): Integer; overload; stdcall;
    function workUnCompleted(const code : Integer): Integer; overload; stdcall;

    function getShortObjectWithBillAndPaySum(const anObjectCode: Integer): ENServicesFromSideObjectShort; stdcall;


  end;



implementation

  destructor ENServicesFromSideObject.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
 if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;

{
  destructor ENServicesFromSideObjectFilter.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;
}

  destructor ENServicesFromSideObjectFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENServicesFromSideObjectShort.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentDateStart) then
      departmentDateStart.Free;
    if Assigned(FdepartmentDateFinal) then
      departmentDateFinal.Free;
    if Assigned(FgeneralContractRefContractDate) then
      generalContractRefContractDate.Free;
    if Assigned(FgeneralContractRefContractRegDate) then
      generalContractRefContractRegDate.Free;
    if Assigned(FgeneralContractRefContractStartDate) then
      generalContractRefContractStartDate.Free;
    if Assigned(FgeneralContractRefContractEndDate) then
      generalContractRefContractEndDate.Free;
    if Assigned(FgeneralContractRefAxContractDate) then
      generalContractRefAxContractDate.Free;
    inherited Destroy;
  end;

  destructor ENServicesFromSideObjectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServicesFromSideObject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesFromSideObject');
  RemClassRegistry.RegisterXSClass(ENServicesFromSideObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesFromSideObjectRef');
  RemClassRegistry.RegisterXSClass(ENServicesFromSideObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesFromSideObjectFilter');
  RemClassRegistry.RegisterXSClass(ENServicesFromSideObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesFromSideObjectShort');
  RemClassRegistry.RegisterXSClass(ENServicesFromSideObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesFromSideObjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServicesFromSideObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServicesFromSideObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENServicesFromSideObjectControllerSoapPort), 'http://ksoe.org/ENServicesFromSideObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServicesFromSideObjectControllerSoapPort), 'http://ksoe.org/ENServicesFromSideObjectController/action/ENServicesFromSideObjectController.%operationName%');


end.
