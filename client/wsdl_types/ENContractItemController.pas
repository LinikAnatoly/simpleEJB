unit ENContractItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,TKMaterialsController 
   ,ENContractController 
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

  ENContractItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENContractItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENContractItem = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fprice : TXSDecimal;
    Fcost : TXSDecimal;
    FcommentGen : WideString;
    FcountReal : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Fmaterial : TKMaterials;
//???
    Fcontract : ENContract;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property price : TXSDecimal read Fprice write Fprice; 
    property cost : TXSDecimal read Fcost write Fcost; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property countReal : TXSDecimal read FcountReal write FcountReal;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property material : TKMaterials read Fmaterial write Fmaterial; 
    property contract : ENContract read Fcontract write Fcontract; 
  end;
  
{
  ENContractItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fprice : TXSDecimal;
    Fcost : TXSDecimal;
    FcommentGen : WideString;
    FcountReal : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Fmaterial : TKMaterials;
//???
    Fcontract : ENContract;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property price : TXSDecimal read Fprice write Fprice; 
    property cost : TXSDecimal read Fcost write Fcost; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property countReal : TXSDecimal read FcountReal write FcountReal;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property material : TKMaterials read Fmaterial write Fmaterial; 
    property contract : ENContract read Fcontract write Fcontract; 
  end;
}

  ENContractItemFilter = class(ENContractItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENContractItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fprice : TXSDecimal;
    Fcost : TXSDecimal;
    FcountReal : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;	
    FmaterialCode : Integer; 
    FmaterialName : WideString;
    FcontractCode : Integer; 
    FcontractContractNumber : WideString;
    FcontractContractDate : TXSDate;
    FcontractFinDocCode : WideString;
    FcontractFinDocID : Integer; 
    FcontractUserGen : WideString;
    FcontractDateEdit : TXSDate;
    Fcountbinded :TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property price : TXSDecimal read Fprice write Fprice; 
    property cost : TXSDecimal read Fcost write Fcost; 
    property countReal : TXSDecimal read FcountReal write FcountReal;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property materialCode : Integer read FmaterialCode write FmaterialCode; 
    property materialName : WideString read FmaterialName write FmaterialName; 
    property contractCode : Integer read FcontractCode write FcontractCode; 
    property contractContractNumber : WideString read FcontractContractNumber write FcontractContractNumber; 
    property contractContractDate : TXSDate read FcontractContractDate write FcontractContractDate; 
    property contractFinDocCode : WideString read FcontractFinDocCode write FcontractFinDocCode; 
    property contractFinDocID : Integer read FcontractFinDocID write FcontractFinDocID; 
    property contractUserGen : WideString read FcontractUserGen write FcontractUserGen; 
    property contractDateEdit : TXSDate read FcontractDateEdit write FcontractDateEdit;
    property countbinded :  TXSDecimal read Fcountbinded write Fcountbinded;
  end;

  ArrayOfENContractItemShort = array of ENContractItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENContractItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENContractItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENContractItemShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENContractItemController/message/
  // soapAction: http://ksoe.org/ENContractItemController/action/ENContractItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENContractItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENContractItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENContractItemControllerSoapPort = interface(IInvokable)
  ['{4c134c13-4c13-4c13-4c13-4c134c134c13}']
    function  add(const aENContractItem: ENContractItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENContractItem: ENContractItem); stdcall;
    function  getObject(const anObjectCode: Integer): ENContractItem; stdcall;
    function  getList: ENContractItemShortList; stdcall;
    function  getFilteredList(const aENContractItemFilter: ENContractItemFilter): ENContractItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENContractItemShortList; stdcall;
    function  getScrollableFilteredList(const aENContractItemFilter: ENContractItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENContractItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENContractItemShortList; stdcall;
  end; 


implementation

  destructor ENContractItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FcountReal) then
      countReal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fmaterial) then
      material.Free;
    if Assigned(Fcontract) then
      contract.Free;
    inherited Destroy;
  end;

{  
  destructor ENContractItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FcountReal) then
      countReal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fmaterial) then
      material.Free;
    if Assigned(Fcontract) then
      contract.Free;
    inherited Destroy;
  end; 
}

  destructor ENContractItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENContractItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FcountReal) then
      countReal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcontractContractDate) then
      contractContractDate.Free;
    if Assigned(FcontractDateEdit) then
      contractDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENContractItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENContractItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContractItem');
  RemClassRegistry.RegisterXSClass(ENContractItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContractItemRef');
  RemClassRegistry.RegisterXSClass(ENContractItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContractItemFilter');
  RemClassRegistry.RegisterXSClass(ENContractItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContractItemShort');
  RemClassRegistry.RegisterXSClass(ENContractItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContractItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENContractItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENContractItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENContractItemControllerSoapPort), 'http://ksoe.org/ENContractItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENContractItemControllerSoapPort), 'http://ksoe.org/ENContractItemController/action/ENContractItemController.%operationName%');


end.
