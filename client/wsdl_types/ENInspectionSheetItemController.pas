unit ENInspectionSheetItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
   , ENInspectionSheetController
   , TKClassificationTypeController
   , ENElementController
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

  ENInspectionSheetItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInspectionSheetItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInspectionSheetItem = class(TRemotable)
  private
    Fcode : Integer;
    FdefectCode : WideString;
    FdefectName : WideString;
    FcommentGen : WideString;
    FisDetecting : Integer;
    FcountGen : TXSDecimal;
    FcountDefects : TXSDecimal;
    FdefectLength : TXSDecimal;
    FcoefficientKi : TXSDecimal;
    FpointsPi : TXSDecimal;
    FweightXi : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FsheetRef : ENInspectionSheetRef;
//???
    FclassificationTypeRef : TKClassificationTypeRef;
//???
    FelementRef : ENElementRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property defectCode : WideString read FdefectCode write FdefectCode;
    property defectName : WideString read FdefectName write FdefectName;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property isDetecting : Integer read FisDetecting write FisDetecting;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countDefects : TXSDecimal read FcountDefects write FcountDefects;
    property defectLength : TXSDecimal read FdefectLength write FdefectLength;
    property coefficientKi : TXSDecimal read FcoefficientKi write FcoefficientKi;
    property pointsPi : TXSDecimal read FpointsPi write FpointsPi;
    property weightXi : TXSDecimal read FweightXi write FweightXi;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property sheetRef : ENInspectionSheetRef read FsheetRef write FsheetRef;
    property classificationTypeRef : TKClassificationTypeRef read FclassificationTypeRef write FclassificationTypeRef;
    property elementRef : ENElementRef read FelementRef write FelementRef;
  end;

{
  ENInspectionSheetItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdefectCode : WideString;
    FdefectName : WideString;
    FcommentGen : WideString;
    FisDetecting : Integer;
    FcountGen : TXSDecimal;
    FcountDefects : TXSDecimal;
    FdefectLength : TXSDecimal;
    FcoefficientKi : TXSDecimal;
    FpointsPi : TXSDecimal;
    FweightXi : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FsheetRef : ENInspectionSheetRef;
//???
    FclassificationTypeRef : TKClassificationTypeRef;
//???
    FelementRef : ENElementRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property defectCode : WideString read FdefectCode write FdefectCode;
    property defectName : WideString read FdefectName write FdefectName;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property isDetecting : Integer read FisDetecting write FisDetecting;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countDefects : TXSDecimal read FcountDefects write FcountDefects;
    property defectLength : TXSDecimal read FdefectLength write FdefectLength;
    property coefficientKi : TXSDecimal read FcoefficientKi write FcoefficientKi;
    property pointsPi : TXSDecimal read FpointsPi write FpointsPi;
    property weightXi : TXSDecimal read FweightXi write FweightXi;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property sheetRef : ENInspectionSheetRef read FsheetRef write FsheetRef;
    property classificationTypeRef : TKClassificationTypeRef read FclassificationTypeRef write FclassificationTypeRef;
    property elementRef : ENElementRef read FelementRef write FelementRef;
  end;
}

  ENInspectionSheetItemFilter = class(ENInspectionSheetItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENInspectionSheetItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FdefectCode : WideString;
    FdefectName : WideString;
    FcommentGen : WideString;
    FisDetecting : Integer;
    FcountGen : TXSDecimal;
    FcountDefects : TXSDecimal;
    FdefectLength : TXSDecimal;
    FcoefficientKi : TXSDecimal;
    FpointsPi : TXSDecimal;
    FweightXi : TXSDecimal;
    FuserGen : WideString;
    FsheetRefCode : Integer;
    FsheetRefName : WideString;
    FsheetRefInspectionKind : Integer;
    FsheetRefDateGen : TXSDate;
    FsheetRefExecutor : WideString;
    FsheetRefAccepted : WideString;
    FsheetRefObjectInvNumber : WideString;
    FsheetRefObjectName : WideString;
    FsheetRefEquipmentKind : Integer;
    FsheetRefTakeIntoCalculation : Integer;
    FsheetRefUserGen : WideString;
    FsheetRefDateEdit : TXSDate;
    FclassificationTypeRefCode : Integer;
    FclassificationTypeRefName : WideString;
    FclassificationTypeRefKod : WideString;
    FclassificationTypeParentRefCode : Integer;
    FelementRefCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property defectCode : WideString read FdefectCode write FdefectCode;
    property defectName : WideString read FdefectName write FdefectName;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property  isDetecting : Integer read FisDetecting write FisDetecting;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countDefects : TXSDecimal read FcountDefects write FcountDefects;
    property defectLength : TXSDecimal read FdefectLength write FdefectLength;
    property coefficientKi : TXSDecimal read FcoefficientKi write FcoefficientKi;
    property pointsPi : TXSDecimal read FpointsPi write FpointsPi;
    property weightXi : TXSDecimal read FweightXi write FweightXi;
    property userGen : WideString read FuserGen write FuserGen;

    property sheetRefCode : Integer read FsheetRefCode write FsheetRefCode;
    property sheetRefName : WideString read FsheetRefName write FsheetRefName;
    property sheetRefInspectionKind : Integer read FsheetRefInspectionKind write FsheetRefInspectionKind;
    property sheetRefDateGen : TXSDate read FsheetRefDateGen write FsheetRefDateGen;
    property sheetRefExecutor : WideString read FsheetRefExecutor write FsheetRefExecutor;
    property sheetRefAccepted : WideString read FsheetRefAccepted write FsheetRefAccepted;
    property sheetRefObjectInvNumber : WideString read FsheetRefObjectInvNumber write FsheetRefObjectInvNumber;
    property sheetRefObjectName : WideString read FsheetRefObjectName write FsheetRefObjectName;
    property sheetRefEquipmentKind : Integer read FsheetRefEquipmentKind write FsheetRefEquipmentKind;
    property sheetRefTakeIntoCalculation : Integer read FsheetRefTakeIntoCalculation write FsheetRefTakeIntoCalculation;
    property sheetRefUserGen : WideString read FsheetRefUserGen write FsheetRefUserGen;
    property sheetRefDateEdit : TXSDate read FsheetRefDateEdit write FsheetRefDateEdit;
    property classificationTypeRefCode : Integer read FclassificationTypeRefCode write FclassificationTypeRefCode;
    property classificationTypeRefName : WideString read FclassificationTypeRefName write FclassificationTypeRefName;
    property classificationTypeRefKod : WideString read FclassificationTypeRefKod write FclassificationTypeRefKod;
    property classificationTypeParentRefCode : Integer read FclassificationTypeParentRefCode write FclassificationTypeParentRefCode;
    property elementRefCode : Integer read FelementRefCode write FelementRefCode;
  end;

  ArrayOfENInspectionSheetItemShort = array of ENInspectionSheetItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENInspectionSheetItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENInspectionSheetItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENInspectionSheetItemShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENInspectionSheetItemController/message/
  // soapAction: http://ksoe.org/ENInspectionSheetItemController/action/ENInspectionSheetItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENInspectionSheetItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENInspectionSheetItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENInspectionSheetItemControllerSoapPort = interface(IInvokable)
  ['{33036E5B-38A6-4F2D-9E7A-52E83CD2B4A5}']
    function add(const aENInspectionSheetItem: ENInspectionSheetItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENInspectionSheetItem: ENInspectionSheetItem); stdcall;
    function getObject(const anObjectCode: Integer): ENInspectionSheetItem; stdcall;
    function getList: ENInspectionSheetItemShortList; stdcall;
    function getFilteredList(const aENInspectionSheetItemFilter: ENInspectionSheetItemFilter): ENInspectionSheetItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENInspectionSheetItemShortList; stdcall;
    function getScrollableFilteredList(const aENInspectionSheetItemFilter: ENInspectionSheetItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENInspectionSheetItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENInspectionSheetItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENInspectionSheetItemFilter: ENInspectionSheetItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENInspectionSheetItemShort; stdcall;
  end;


implementation

  destructor ENInspectionSheetItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountDefects) then
      countDefects.Free;
    if Assigned(FdefectLength) then
      defectLength.Free;
    if Assigned(FcoefficientKi) then
      coefficientKi.Free;
    if Assigned(FpointsPi) then
      pointsPi.Free;
    if Assigned(FweightXi) then
      weightXi.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FsheetRef) then
      sheetRef.Free;
    if Assigned(FclassificationTypeRef) then
      classificationTypeRef.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    inherited Destroy;
  end;

{
  destructor ENInspectionSheetItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountDefects) then
      countDefects.Free;
    if Assigned(FdefectLength) then
      defectLength.Free;
    if Assigned(FcoefficientKi) then
      coefficientKi.Free;
    if Assigned(FpointsPi) then
      pointsPi.Free;
    if Assigned(FweightXi) then
      weightXi.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FsheetRef) then
      sheetRef.Free;
    if Assigned(FclassificationTypeRef) then
      classificationTypeRef.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    inherited Destroy;
  end;
}

  destructor ENInspectionSheetItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENInspectionSheetItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountDefects) then
      countDefects.Free;
    if Assigned(FdefectLength) then
      defectLength.Free;
    if Assigned(FcoefficientKi) then
      coefficientKi.Free;
    if Assigned(FpointsPi) then
      pointsPi.Free;
    if Assigned(FweightXi) then
      weightXi.Free;
    if Assigned(FsheetRefDateGen) then
      sheetRefDateGen.Free;
    if Assigned(FsheetRefDateEdit) then
      sheetRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENInspectionSheetItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENInspectionSheetItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInspectionSheetItem');
  RemClassRegistry.RegisterXSClass(ENInspectionSheetItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInspectionSheetItemRef');
  RemClassRegistry.RegisterXSClass(ENInspectionSheetItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInspectionSheetItemFilter');
  RemClassRegistry.RegisterXSClass(ENInspectionSheetItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInspectionSheetItemShort');
  RemClassRegistry.RegisterXSClass(ENInspectionSheetItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInspectionSheetItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENInspectionSheetItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENInspectionSheetItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENInspectionSheetItemControllerSoapPort), 'http://ksoe.org/ENInspectionSheetItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENInspectionSheetItemControllerSoapPort), 'http://ksoe.org/ENInspectionSheetItemController/action/ENInspectionSheetItemController.%operationName%');


end.
