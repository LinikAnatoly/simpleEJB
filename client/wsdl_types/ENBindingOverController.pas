unit ENBindingOverController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENBindingOverOrganizationController 
   ,ENPlanWorkController 
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

  ENBindingOver            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBindingOverRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBindingOver = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FitemText : WideString;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Forganization : ENBindingOverOrganization;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property itemText : WideString read FitemText write FitemText;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property organization : ENBindingOverOrganization read Forganization write Forganization; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
  end;

  ENBindingOverFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FitemText : WideString;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Forganization : ENBindingOverOrganization;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property itemText : WideString read FitemText write FitemText;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property organization : ENBindingOverOrganization read Forganization write Forganization; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
  end;


  ENBindingOverShort = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FitemText : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    ForganizationCode : Integer; 
    ForganizationName : WideString;
    FplanRefCode : Integer; 
    FplanRefDateGen : TXSDate;
    FplanRefDateStart : TXSDate;
    FplanRefDateFinal : TXSDate;
    FplanRefYearGen : Integer; 
    FplanRefMonthGen : Integer; 
    FplanRefUserGen : WideString;
    FplanRefDateEdit : TXSDate;
    FplanRefWorkOrderNumber : WideString;
    FplanRefDateWorkOrder : TXSDate;
    FplanRefPriConnectionNumber : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property itemText : WideString read FitemText write FitemText;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property organizationCode : Integer read ForganizationCode write ForganizationCode; 
    property organizationName : WideString read ForganizationName write ForganizationName; 
    property planRefCode : Integer read FplanRefCode write FplanRefCode; 
    property planRefDateGen : TXSDate read FplanRefDateGen write FplanRefDateGen; 
    property planRefDateStart : TXSDate read FplanRefDateStart write FplanRefDateStart; 
    property planRefDateFinal : TXSDate read FplanRefDateFinal write FplanRefDateFinal; 
    property planRefYearGen : Integer read FplanRefYearGen write FplanRefYearGen; 
    property planRefMonthGen : Integer read FplanRefMonthGen write FplanRefMonthGen; 
    property planRefUserGen : WideString read FplanRefUserGen write FplanRefUserGen; 
    property planRefDateEdit : TXSDate read FplanRefDateEdit write FplanRefDateEdit; 
    property planRefWorkOrderNumber : WideString read FplanRefWorkOrderNumber write FplanRefWorkOrderNumber; 
    property planRefDateWorkOrder : TXSDate read FplanRefDateWorkOrder write FplanRefDateWorkOrder; 
    property planRefPriConnectionNumber : WideString read FplanRefPriConnectionNumber write FplanRefPriConnectionNumber; 
  end;

  ArrayOfENBindingOverShort = array of ENBindingOverShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBindingOverShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBindingOverShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBindingOverShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBindingOverController/message/
  // soapAction: http://ksoe.org/ENBindingOverController/action/ENBindingOverController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBindingOverControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBindingOverController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBindingOverControllerSoapPort = interface(IInvokable)
  ['{79ec79ec-79ec-79ec-79ec-79ec79ec79ec}']
    function  add(const aENBindingOver: ENBindingOver): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBindingOver: ENBindingOver); stdcall;
    function  getObject(const anObjectCode: Integer): ENBindingOver; stdcall;
    function  getList: ENBindingOverShortList; stdcall;
    function  getFilteredList(const aENBindingOverFilter: ENBindingOverFilter): ENBindingOverShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBindingOverShortList; stdcall;
    function  getScrollableFilteredList(const aENBindingOverFilter: ENBindingOverFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBindingOverShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBindingOverShortList; stdcall;
  end; 


implementation

  destructor ENBindingOver.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Forganization) then
      organization.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;
  
  destructor ENBindingOverFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Forganization) then
      organization.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end; 
  
  destructor ENBindingOverShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRefDateGen) then
      planRefDateGen.Free;
    if Assigned(FplanRefDateStart) then
      planRefDateStart.Free;
    if Assigned(FplanRefDateFinal) then
      planRefDateFinal.Free;
    if Assigned(FplanRefDateEdit) then
      planRefDateEdit.Free;
    if Assigned(FplanRefDateWorkOrder) then
      planRefDateWorkOrder.Free;
    inherited Destroy;
  end; 
  
  destructor ENBindingOverShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBindingOver, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBindingOver');
  RemClassRegistry.RegisterXSClass(ENBindingOverRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBindingOverRef');
  RemClassRegistry.RegisterXSClass(ENBindingOverFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBindingOverFilter');
  RemClassRegistry.RegisterXSClass(ENBindingOverShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBindingOverShort');
  RemClassRegistry.RegisterXSClass(ENBindingOverShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBindingOverShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBindingOverShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBindingOverShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBindingOverControllerSoapPort), 'http://ksoe.org/ENBindingOverController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBindingOverControllerSoapPort), 'http://ksoe.org/ENBindingOverController/action/ENBindingOverController.%operationName%');


end.
