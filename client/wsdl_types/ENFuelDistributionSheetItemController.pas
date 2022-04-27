unit ENFuelDistributionSheetItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDepartmentController
   ,ENFuelDistributionSheetController
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

  ENFuelDistributionSheetItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelDistributionSheetItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelDistributionSheetItem = class(TRemotable)
  private
    Fcode : Integer;
    FdecadeNumber : Integer;
    FcountGen : TXSDecimal;
    Fcount1 : TXSDecimal;
    Fcount2 : TXSDecimal;
    Fcount3 : TXSDecimal;
    Fcount4 : TXSDecimal;
    Fcount5 : TXSDecimal;
    Fcount6 : TXSDecimal;
    Fcount7 : TXSDecimal;	
    FisConfirmed : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FfuelDistributionRef : ENFuelDistributionSheetRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  decadeNumber : Integer read FdecadeNumber write FdecadeNumber;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property count1 : TXSDecimal read Fcount1 write Fcount1;
    property count2 : TXSDecimal read Fcount2 write Fcount2;
    property count3 : TXSDecimal read Fcount3 write Fcount3;
    property count4 : TXSDecimal read Fcount4 write Fcount4;
    property count5 : TXSDecimal read Fcount5 write Fcount5;
    property count6 : TXSDecimal read Fcount6 write Fcount6;
    property count7 : TXSDecimal read Fcount7 write Fcount7;	
    property isConfirmed : Integer read FisConfirmed write FisConfirmed;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property fuelDistributionRef : ENFuelDistributionSheetRef read FfuelDistributionRef write FfuelDistributionRef;
  end;

{
  ENFuelDistributionSheetItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdecadeNumber : Integer;
    FcountGen : TXSDecimal;
    Fcount1 : TXSDecimal;
    Fcount2 : TXSDecimal;
    Fcount3 : TXSDecimal;
    Fcount4 : TXSDecimal;
    Fcount5 : TXSDecimal;
    Fcount6 : TXSDecimal;
    Fcount7 : TXSDecimal;
    FisConfirmed : Integer;	
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FfuelDistributionRef : ENFuelDistributionSheetRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  decadeNumber : Integer read FdecadeNumber write FdecadeNumber;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property count1 : TXSDecimal read Fcount1 write Fcount1;
    property count2 : TXSDecimal read Fcount2 write Fcount2;
    property count3 : TXSDecimal read Fcount3 write Fcount3;
    property count4 : TXSDecimal read Fcount4 write Fcount4;
    property count5 : TXSDecimal read Fcount5 write Fcount5;
    property count6 : TXSDecimal read Fcount6 write Fcount6;
    property count7 : TXSDecimal read Fcount7 write Fcount7;
    property  isConfirmed : Integer read FisConfirmed write FisConfirmed;	
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property fuelDistributionRef : ENFuelDistributionSheetRef read FfuelDistributionRef write FfuelDistributionRef;
  end;
}

  ENFuelDistributionSheetItemFilter = class(ENFuelDistributionSheetItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENFuelDistributionSheetItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FdecadeNumber : Integer;
    FcountGen : TXSDecimal;
    Fcount1 : TXSDecimal;
    Fcount2 : TXSDecimal;
    Fcount3 : TXSDecimal;
    Fcount4 : TXSDecimal;
    Fcount5 : TXSDecimal;
    Fcount6 : TXSDecimal;
    Fcount7 : TXSDecimal;	
    FisConfirmed : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FdepartmentRefCode : Integer;
    FdepartmentRefShortName : WideString;
    FdepartmentRefDateStart : TXSDate;
    FdepartmentRefDateFinal : TXSDate;
    FdepartmentRefRenCode : Integer;
    FdepartmentRefShpzBalans : WideString;
    FdepartmentRefKau_table_id_1884 : Integer;
    FdepartmentRefKau_1884 : WideString;
    FdepartmentRefName_1884 : WideString;
    FfuelDistributionRefCode : Integer;
    FfuelDistributionRefMonthGen : Integer;
    FfuelDistributionRefYearGen : Integer;
    FfuelDistributionRefTotalSum : TXSDecimal;
    FfuelDistributionRefSum1 : TXSDecimal;
    FfuelDistributionRefSum2 : TXSDecimal;
    FfuelDistributionRefSum3 : TXSDecimal;
    FfuelDistributionRefSum4 : TXSDecimal;
    FfuelDistributionRefSum5 : TXSDecimal;
    FfuelDistributionRefSum6 : TXSDecimal;
    FfuelDistributionRefSum7 : TXSDecimal;	
    FfuelDistributionRefSum1dec1 : TXSDecimal;
    FfuelDistributionRefSum2dec1 : TXSDecimal;
    FfuelDistributionRefSum3dec1 : TXSDecimal;
    FfuelDistributionRefSum4dec1 : TXSDecimal;
    FfuelDistributionRefSum5dec1 : TXSDecimal;
    FfuelDistributionRefSum6dec1 : TXSDecimal;
    FfuelDistributionRefSum7dec1 : TXSDecimal;	
    FfuelDistributionRefSum1dec2 : TXSDecimal;
    FfuelDistributionRefSum2dec2 : TXSDecimal;
    FfuelDistributionRefSum3dec2 : TXSDecimal;
    FfuelDistributionRefSum4dec2 : TXSDecimal;
    FfuelDistributionRefSum5dec2 : TXSDecimal;
    FfuelDistributionRefSum6dec2 : TXSDecimal;
    FfuelDistributionRefSum7dec2 : TXSDecimal;
    FfuelDistributionRefSum1dec3 : TXSDecimal;
    FfuelDistributionRefSum2dec3 : TXSDecimal;
    FfuelDistributionRefSum3dec3 : TXSDecimal;
    FfuelDistributionRefSum4dec3 : TXSDecimal;
    FfuelDistributionRefSum5dec3 : TXSDecimal;
    FfuelDistributionRefSum6dec3 : TXSDecimal;
    FfuelDistributionRefSum7dec3 : TXSDecimal;	
    FfuelDistributionRefUserGen : WideString;
    FfuelDistributionRefDateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  decadeNumber : Integer read FdecadeNumber write FdecadeNumber;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property count1 : TXSDecimal read Fcount1 write Fcount1;
    property count2 : TXSDecimal read Fcount2 write Fcount2;
    property count3 : TXSDecimal read Fcount3 write Fcount3;
    property count4 : TXSDecimal read Fcount4 write Fcount4;
    property count5 : TXSDecimal read Fcount5 write Fcount5;
    property count6 : TXSDecimal read Fcount6 write Fcount6;
    property count7 : TXSDecimal read Fcount7 write Fcount7;	
    property isConfirmed : Integer read FisConfirmed write FisConfirmed;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode;
    property departmentRefShortName : WideString read FdepartmentRefShortName write FdepartmentRefShortName;
    property departmentRefDateStart : TXSDate read FdepartmentRefDateStart write FdepartmentRefDateStart;
    property departmentRefDateFinal : TXSDate read FdepartmentRefDateFinal write FdepartmentRefDateFinal;
    property departmentRefRenCode : Integer read FdepartmentRefRenCode write FdepartmentRefRenCode;
    property departmentRefShpzBalans : WideString read FdepartmentRefShpzBalans write FdepartmentRefShpzBalans;
    property departmentRefKau_table_id_1884 : Integer read FdepartmentRefKau_table_id_1884 write FdepartmentRefKau_table_id_1884;
    property departmentRefKau_1884 : WideString read FdepartmentRefKau_1884 write FdepartmentRefKau_1884;
    property departmentRefName_1884 : WideString read FdepartmentRefName_1884 write FdepartmentRefName_1884;
    property fuelDistributionRefCode : Integer read FfuelDistributionRefCode write FfuelDistributionRefCode;
    property fuelDistributionRefMonthGen : Integer read FfuelDistributionRefMonthGen write FfuelDistributionRefMonthGen;
    property fuelDistributionRefYearGen : Integer read FfuelDistributionRefYearGen write FfuelDistributionRefYearGen;
    property fuelDistributionRefTotalSum : TXSDecimal read FfuelDistributionRefTotalSum write FfuelDistributionRefTotalSum;
    property fuelDistributionRefSum1 : TXSDecimal read FfuelDistributionRefSum1 write FfuelDistributionRefSum1;
    property fuelDistributionRefSum2 : TXSDecimal read FfuelDistributionRefSum2 write FfuelDistributionRefSum2;
    property fuelDistributionRefSum3 : TXSDecimal read FfuelDistributionRefSum3 write FfuelDistributionRefSum3;
    property fuelDistributionRefSum4 : TXSDecimal read FfuelDistributionRefSum4 write FfuelDistributionRefSum4;
    property fuelDistributionRefSum5 : TXSDecimal read FfuelDistributionRefSum5 write FfuelDistributionRefSum5;
    property fuelDistributionRefSum6 : TXSDecimal read FfuelDistributionRefSum6 write FfuelDistributionRefSum6;
    property fuelDistributionRefSum7 : TXSDecimal read FfuelDistributionRefSum7 write FfuelDistributionRefSum7;	
    property fuelDistributionRefSum1dec1 : TXSDecimal read FfuelDistributionRefSum1dec1 write FfuelDistributionRefSum1dec1;
    property fuelDistributionRefSum2dec1 : TXSDecimal read FfuelDistributionRefSum2dec1 write FfuelDistributionRefSum2dec1;
    property fuelDistributionRefSum3dec1 : TXSDecimal read FfuelDistributionRefSum3dec1 write FfuelDistributionRefSum3dec1;
    property fuelDistributionRefSum4dec1 : TXSDecimal read FfuelDistributionRefSum4dec1 write FfuelDistributionRefSum4dec1;
    property fuelDistributionRefSum5dec1 : TXSDecimal read FfuelDistributionRefSum5dec1 write FfuelDistributionRefSum5dec1;
    property fuelDistributionRefSum6dec1 : TXSDecimal read FfuelDistributionRefSum6dec1 write FfuelDistributionRefSum6dec1;
    property fuelDistributionRefSum7dec1 : TXSDecimal read FfuelDistributionRefSum7dec1 write FfuelDistributionRefSum7dec1;	
    property fuelDistributionRefSum1dec2 : TXSDecimal read FfuelDistributionRefSum1dec2 write FfuelDistributionRefSum1dec2;
    property fuelDistributionRefSum2dec2 : TXSDecimal read FfuelDistributionRefSum2dec2 write FfuelDistributionRefSum2dec2;
    property fuelDistributionRefSum3dec2 : TXSDecimal read FfuelDistributionRefSum3dec2 write FfuelDistributionRefSum3dec2;
    property fuelDistributionRefSum4dec2 : TXSDecimal read FfuelDistributionRefSum4dec2 write FfuelDistributionRefSum4dec2;
    property fuelDistributionRefSum5dec2 : TXSDecimal read FfuelDistributionRefSum5dec2 write FfuelDistributionRefSum5dec2;
    property fuelDistributionRefSum6dec2 : TXSDecimal read FfuelDistributionRefSum6dec2 write FfuelDistributionRefSum6dec2;
    property fuelDistributionRefSum7dec2 : TXSDecimal read FfuelDistributionRefSum7dec2 write FfuelDistributionRefSum7dec2;	
    property fuelDistributionRefSum1dec3 : TXSDecimal read FfuelDistributionRefSum1dec3 write FfuelDistributionRefSum1dec3;
    property fuelDistributionRefSum2dec3 : TXSDecimal read FfuelDistributionRefSum2dec3 write FfuelDistributionRefSum2dec3;
    property fuelDistributionRefSum3dec3 : TXSDecimal read FfuelDistributionRefSum3dec3 write FfuelDistributionRefSum3dec3;
    property fuelDistributionRefSum4dec3 : TXSDecimal read FfuelDistributionRefSum4dec3 write FfuelDistributionRefSum4dec3;
    property fuelDistributionRefSum5dec3 : TXSDecimal read FfuelDistributionRefSum5dec3 write FfuelDistributionRefSum5dec3;
    property fuelDistributionRefSum6dec3 : TXSDecimal read FfuelDistributionRefSum6dec3 write FfuelDistributionRefSum6dec3;
    property fuelDistributionRefSum7dec3 : TXSDecimal read FfuelDistributionRefSum7dec3 write FfuelDistributionRefSum7dec3;	
    property fuelDistributionRefUserGen : WideString read FfuelDistributionRefUserGen write FfuelDistributionRefUserGen;
    property fuelDistributionRefDateEdit : TXSDateTime read FfuelDistributionRefDateEdit write FfuelDistributionRefDateEdit;
  end;

  ArrayOfENFuelDistributionSheetItemShort = array of ENFuelDistributionSheetItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENFuelDistributionSheetItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENFuelDistributionSheetItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENFuelDistributionSheetItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENFuelDistributionSheetItemController/message/
  // soapAction: http://ksoe.org/ENFuelDistributionSheetItemController/action/ENFuelDistributionSheetItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENFuelDistributionSheetItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENFuelDistributionSheetItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENFuelDistributionSheetItemControllerSoapPort = interface(IInvokable)
  ['{71107110-7110-7110-7110-711071107110}']
    function add(const aENFuelDistributionSheetItem: ENFuelDistributionSheetItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENFuelDistributionSheetItem: ENFuelDistributionSheetItem); stdcall;
    function getObject(const anObjectCode: Integer): ENFuelDistributionSheetItem; stdcall;
    function getList: ENFuelDistributionSheetItemShortList; stdcall;
    function getFilteredList(const aENFuelDistributionSheetItemFilter: ENFuelDistributionSheetItemFilter): ENFuelDistributionSheetItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENFuelDistributionSheetItemShortList; stdcall;
    function getScrollableFilteredList(const aENFuelDistributionSheetItemFilter: ENFuelDistributionSheetItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENFuelDistributionSheetItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENFuelDistributionSheetItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENFuelDistributionSheetItemFilter: ENFuelDistributionSheetItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENFuelDistributionSheetItemShort; stdcall;
    function getFreePMM(const anENFuelDistributionSheetCode: Integer): ENFuelDistributionSheetItemShortList; stdcall;
    procedure setConfirmed(const itemCode : Integer; const isConfirmed: Boolean); stdcall;

  end;


implementation

  destructor ENFuelDistributionSheetItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fcount1) then
      count1.Free;
    if Assigned(Fcount2) then
      count2.Free;
    if Assigned(Fcount3) then
      count3.Free;
    if Assigned(Fcount4) then
      count4.Free;
    if Assigned(Fcount5) then
      count5.Free;
      if Assigned(Fcount6) then
      count6.Free;
    if Assigned(Fcount7) then
      count7.Free;	  
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FfuelDistributionRef) then
      fuelDistributionRef.Free;
    inherited Destroy;
  end;

{
  destructor ENFuelDistributionSheetItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fcount1) then
      count1.Free;
    if Assigned(Fcount2) then
      count2.Free;
    if Assigned(Fcount3) then
      count3.Free;
    if Assigned(Fcount4) then
      count4.Free;
    if Assigned(Fcount5) then
      count5.Free;
    if Assigned(Fcount6) then
      count6.Free;
    if Assigned(Fcount7) then
      count7.Free;	  
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FfuelDistributionRef) then
      fuelDistributionRef.Free;
    inherited Destroy;
  end;
}

  destructor ENFuelDistributionSheetItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENFuelDistributionSheetItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fcount1) then
      count1.Free;
    if Assigned(Fcount2) then
      count2.Free;
    if Assigned(Fcount3) then
      count3.Free;
    if Assigned(Fcount4) then
      count4.Free;
    if Assigned(Fcount5) then
      count5.Free;
    if Assigned(Fcount6) then
      count6.Free;
    if Assigned(Fcount7) then
      count7.Free;	  
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    if Assigned(FfuelDistributionRefTotalSum) then
      fuelDistributionRefTotalSum.Free;
    if Assigned(FfuelDistributionRefSum1) then
      fuelDistributionRefSum1.Free;
    if Assigned(FfuelDistributionRefSum2) then
      fuelDistributionRefSum2.Free;
    if Assigned(FfuelDistributionRefSum3) then
      fuelDistributionRefSum3.Free;
    if Assigned(FfuelDistributionRefSum4) then
      fuelDistributionRefSum4.Free;
    if Assigned(FfuelDistributionRefSum5) then
      fuelDistributionRefSum5.Free;
    if Assigned(FfuelDistributionRefSum6) then
      fuelDistributionRefSum6.Free;
    if Assigned(FfuelDistributionRefSum7) then
      fuelDistributionRefSum7.Free;	  
    if Assigned(FfuelDistributionRefSum1dec1) then
      fuelDistributionRefSum1dec1.Free;
    if Assigned(FfuelDistributionRefSum2dec1) then
      fuelDistributionRefSum2dec1.Free;
    if Assigned(FfuelDistributionRefSum3dec1) then
      fuelDistributionRefSum3dec1.Free;
    if Assigned(FfuelDistributionRefSum4dec1) then
      fuelDistributionRefSum4dec1.Free;
    if Assigned(FfuelDistributionRefSum5dec1) then
      fuelDistributionRefSum5dec1.Free;
    if Assigned(FfuelDistributionRefSum6dec1) then
      fuelDistributionRefSum6dec1.Free;
    if Assigned(FfuelDistributionRefSum7dec1) then
      fuelDistributionRefSum7dec1.Free;	  
    if Assigned(FfuelDistributionRefSum1dec2) then
      fuelDistributionRefSum1dec2.Free;
    if Assigned(FfuelDistributionRefSum2dec2) then
      fuelDistributionRefSum2dec2.Free;
    if Assigned(FfuelDistributionRefSum3dec2) then
      fuelDistributionRefSum3dec2.Free;
    if Assigned(FfuelDistributionRefSum4dec2) then
      fuelDistributionRefSum4dec2.Free;
    if Assigned(FfuelDistributionRefSum5dec2) then
      fuelDistributionRefSum5dec2.Free;
    if Assigned(FfuelDistributionRefSum6dec2) then
      fuelDistributionRefSum6dec2.Free;
    if Assigned(FfuelDistributionRefSum7dec2) then
      fuelDistributionRefSum7dec2.Free;	  
    if Assigned(FfuelDistributionRefSum1dec3) then
      fuelDistributionRefSum1dec3.Free;
    if Assigned(FfuelDistributionRefSum2dec3) then
      fuelDistributionRefSum2dec3.Free;
    if Assigned(FfuelDistributionRefSum3dec3) then
      fuelDistributionRefSum3dec3.Free;
    if Assigned(FfuelDistributionRefSum4dec3) then
      fuelDistributionRefSum4dec3.Free;
    if Assigned(FfuelDistributionRefSum5dec3) then
      fuelDistributionRefSum5dec3.Free;
    if Assigned(FfuelDistributionRefSum6dec3) then
      fuelDistributionRefSum6dec3.Free;
    if Assigned(FfuelDistributionRefSum7dec3) then
      fuelDistributionRefSum7dec3.Free;	  
    if Assigned(FfuelDistributionRefDateEdit) then
      fuelDistributionRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENFuelDistributionSheetItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENFuelDistributionSheetItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelDistributionSheetItem');
  RemClassRegistry.RegisterXSClass(ENFuelDistributionSheetItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelDistributionSheetItemRef');
  RemClassRegistry.RegisterXSClass(ENFuelDistributionSheetItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelDistributionSheetItemFilter');
  RemClassRegistry.RegisterXSClass(ENFuelDistributionSheetItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelDistributionSheetItemShort');
  RemClassRegistry.RegisterXSClass(ENFuelDistributionSheetItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelDistributionSheetItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENFuelDistributionSheetItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENFuelDistributionSheetItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENFuelDistributionSheetItemControllerSoapPort), 'http://ksoe.org/ENFuelDistributionSheetItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENFuelDistributionSheetItemControllerSoapPort), 'http://ksoe.org/ENFuelDistributionSheetItemController/action/ENFuelDistributionSheetItemController.%operationName%');


end.
