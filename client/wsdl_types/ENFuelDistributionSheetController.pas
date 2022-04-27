unit ENFuelDistributionSheetController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKFuelTypeController
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

  ENFuelDistributionSheet            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelDistributionSheetRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelDistributionSheet = class(TRemotable)
  private
    Fcode : Integer;
    FmonthGen : Integer;
    FyearGen : Integer;
    FtotalSum : TXSDecimal;
    Fsum1 : TXSDecimal;
    Fsum2 : TXSDecimal;
    Fsum3 : TXSDecimal;
    Fsum4 : TXSDecimal;
    Fsum5 : TXSDecimal;
    Fsum6 : TXSDecimal;
    Fsum7 : TXSDecimal;
    Fsum1dec1 : TXSDecimal;
    Fsum2dec1 : TXSDecimal;
    Fsum3dec1 : TXSDecimal;
    Fsum4dec1 : TXSDecimal;
    Fsum5dec1 : TXSDecimal;
    Fsum6dec1 : TXSDecimal;	
    Fsum7dec1 : TXSDecimal;
    Fsum1dec2 : TXSDecimal;
    Fsum2dec2 : TXSDecimal;
    Fsum3dec2 : TXSDecimal;
    Fsum4dec2 : TXSDecimal;
    Fsum5dec2 : TXSDecimal;
    Fsum6dec2 : TXSDecimal;	
    Fsum7dec2 : TXSDecimal;
    Fsum1dec3 : TXSDecimal;
    Fsum2dec3 : TXSDecimal;
    Fsum3dec3 : TXSDecimal;
    Fsum4dec3 : TXSDecimal;
    Fsum5dec3 : TXSDecimal;
    Fsum6dec3 : TXSDecimal;	
    Fsum7dec3 : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FfuelTypeRef : TKFuelTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  monthGen : Integer read FmonthGen write FmonthGen;
    property  yearGen : Integer read FyearGen write FyearGen;
    property totalSum : TXSDecimal read FtotalSum write FtotalSum;
    property sum1 : TXSDecimal read Fsum1 write Fsum1;
    property sum2 : TXSDecimal read Fsum2 write Fsum2;
    property sum3 : TXSDecimal read Fsum3 write Fsum3;
    property sum4 : TXSDecimal read Fsum4 write Fsum4;
    property sum5 : TXSDecimal read Fsum5 write Fsum5;
    property sum6 : TXSDecimal read Fsum6 write Fsum6;
    property sum7 : TXSDecimal read Fsum7 write Fsum7;
    property sum1dec1 : TXSDecimal read Fsum1dec1 write Fsum1dec1;
    property sum2dec1 : TXSDecimal read Fsum2dec1 write Fsum2dec1;
    property sum3dec1 : TXSDecimal read Fsum3dec1 write Fsum3dec1;
    property sum4dec1 : TXSDecimal read Fsum4dec1 write Fsum4dec1;
    property sum5dec1 : TXSDecimal read Fsum5dec1 write Fsum5dec1;
    property sum6dec1 : TXSDecimal read Fsum6dec1 write Fsum6dec1;
    property sum7dec1 : TXSDecimal read Fsum7dec1 write Fsum7dec1;
    property sum1dec2 : TXSDecimal read Fsum1dec2 write Fsum1dec2;
    property sum2dec2 : TXSDecimal read Fsum2dec2 write Fsum2dec2;
    property sum3dec2 : TXSDecimal read Fsum3dec2 write Fsum3dec2;
    property sum4dec2 : TXSDecimal read Fsum4dec2 write Fsum4dec2;
    property sum5dec2 : TXSDecimal read Fsum5dec2 write Fsum5dec2;
    property sum6dec2 : TXSDecimal read Fsum6dec2 write Fsum6dec2;	
    property sum7dec2 : TXSDecimal read Fsum7dec2 write Fsum7dec2;
    property sum1dec3 : TXSDecimal read Fsum1dec3 write Fsum1dec3;
    property sum2dec3 : TXSDecimal read Fsum2dec3 write Fsum2dec3;
    property sum3dec3 : TXSDecimal read Fsum3dec3 write Fsum3dec3;
    property sum4dec3 : TXSDecimal read Fsum4dec3 write Fsum4dec3;
    property sum5dec3 : TXSDecimal read Fsum5dec3 write Fsum5dec3;
    property sum6dec3 : TXSDecimal read Fsum6dec3 write Fsum6dec3;	
    property sum7dec3 : TXSDecimal read Fsum7dec3 write Fsum7dec3;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property fuelTypeRef : TKFuelTypeRef read FfuelTypeRef write FfuelTypeRef;
  end;

{
  ENFuelDistributionSheetFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FmonthGen : Integer;
    FyearGen : Integer;
    FtotalSum : TXSDecimal;
    Fsum1 : TXSDecimal;
    Fsum2 : TXSDecimal;
    Fsum3 : TXSDecimal;
    Fsum4 : TXSDecimal;
    Fsum5 : TXSDecimal;
    Fsum6 : TXSDecimal;
    Fsum7 : TXSDecimal;
    Fsum1dec1 : TXSDecimal;
    Fsum2dec1 : TXSDecimal;
    Fsum3dec1 : TXSDecimal;
    Fsum4dec1 : TXSDecimal;
    Fsum5dec1 : TXSDecimal;
    Fsum6dec1 : TXSDecimal;
    Fsum7dec1 : TXSDecimal;
    Fsum1dec2 : TXSDecimal;
    Fsum2dec2 : TXSDecimal;
    Fsum3dec2 : TXSDecimal;
    Fsum4dec2 : TXSDecimal;
    Fsum5dec2 : TXSDecimal;
    Fsum6dec2 : TXSDecimal;
    Fsum7dec2 : TXSDecimal;
    Fsum1dec3 : TXSDecimal;
    Fsum2dec3 : TXSDecimal;
    Fsum3dec3 : TXSDecimal;
    Fsum4dec3 : TXSDecimal;
    Fsum5dec3 : TXSDecimal;
    Fsum6dec3 : TXSDecimal;
    Fsum7dec3 : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FfuelTypeRef : TKFuelTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  monthGen : Integer read FmonthGen write FmonthGen;
    property  yearGen : Integer read FyearGen write FyearGen;
    property totalSum : TXSDecimal read FtotalSum write FtotalSum;
    property sum1 : TXSDecimal read Fsum1 write Fsum1;
    property sum2 : TXSDecimal read Fsum2 write Fsum2;
    property sum3 : TXSDecimal read Fsum3 write Fsum3;
    property sum4 : TXSDecimal read Fsum4 write Fsum4;
    property sum5 : TXSDecimal read Fsum5 write Fsum5;
    property sum6 : TXSDecimal read Fsum6 write Fsum6;
    property sum7 : TXSDecimal read Fsum7 write Fsum7;
    property sum1dec1 : TXSDecimal read Fsum1dec1 write Fsum1dec1;
    property sum2dec1 : TXSDecimal read Fsum2dec1 write Fsum2dec1;
    property sum3dec1 : TXSDecimal read Fsum3dec1 write Fsum3dec1;
    property sum4dec1 : TXSDecimal read Fsum4dec1 write Fsum4dec1;
    property sum5dec1 : TXSDecimal read Fsum5dec1 write Fsum5dec1;
    property sum6dec1 : TXSDecimal read Fsum6dec1 write Fsum6dec1;
    property sum7dec1 : TXSDecimal read Fsum7dec1 write Fsum7dec1;
    property sum1dec2 : TXSDecimal read Fsum1dec2 write Fsum1dec2;
    property sum2dec2 : TXSDecimal read Fsum2dec2 write Fsum2dec2;
    property sum3dec2 : TXSDecimal read Fsum3dec2 write Fsum3dec2;
    property sum4dec2 : TXSDecimal read Fsum4dec2 write Fsum4dec2;
    property sum5dec2 : TXSDecimal read Fsum5dec2 write Fsum5dec2;
    property sum6dec2 : TXSDecimal read Fsum6dec2 write Fsum6dec2;
    property sum7dec2 : TXSDecimal read Fsum7dec2 write Fsum7dec2;
    property sum1dec3 : TXSDecimal read Fsum1dec3 write Fsum1dec3;
    property sum2dec3 : TXSDecimal read Fsum2dec3 write Fsum2dec3;
    property sum3dec3 : TXSDecimal read Fsum3dec3 write Fsum3dec3;
    property sum4dec3 : TXSDecimal read Fsum4dec3 write Fsum4dec3;
    property sum5dec3 : TXSDecimal read Fsum5dec3 write Fsum5dec3;
    property sum6dec3 : TXSDecimal read Fsum6dec3 write Fsum6dec3;
    property sum7dec3 : TXSDecimal read Fsum7dec3 write Fsum7dec3;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property fuelTypeRef : TKFuelTypeRef read FfuelTypeRef write FfuelTypeRef;
  end;
}

  ENFuelDistributionSheetFilter = class(ENFuelDistributionSheet)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENFuelDistributionSheetShort = class(TRemotable)
  private
    Fcode : Integer;
    FmonthGen : Integer;
    FyearGen : Integer;
    FtotalSum : TXSDecimal;
    Fsum1 : TXSDecimal;
    Fsum2 : TXSDecimal;
    Fsum3 : TXSDecimal;
    Fsum4 : TXSDecimal;
    Fsum5 : TXSDecimal;
    Fsum6 : TXSDecimal;	
    Fsum7 : TXSDecimal;
    Fsum1dec1 : TXSDecimal;
    Fsum2dec1 : TXSDecimal;
    Fsum3dec1 : TXSDecimal;
    Fsum4dec1 : TXSDecimal;
    Fsum5dec1 : TXSDecimal;
    Fsum6dec1 : TXSDecimal;	
    Fsum7dec1 : TXSDecimal;
    Fsum1dec2 : TXSDecimal;
    Fsum2dec2 : TXSDecimal;
    Fsum3dec2 : TXSDecimal;
    Fsum4dec2 : TXSDecimal;
    Fsum5dec2 : TXSDecimal;
    Fsum6dec2 : TXSDecimal;	
    Fsum7dec2 : TXSDecimal;
    Fsum1dec3 : TXSDecimal;
    Fsum2dec3 : TXSDecimal;
    Fsum3dec3 : TXSDecimal;
    Fsum4dec3 : TXSDecimal;
    Fsum5dec3 : TXSDecimal;
    Fsum6dec3 : TXSDecimal;	
    Fsum7dec3 : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FfuelTypeRefCode : Integer;
    FfuelTypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  monthGen : Integer read FmonthGen write FmonthGen;
    property  yearGen : Integer read FyearGen write FyearGen;
    property totalSum : TXSDecimal read FtotalSum write FtotalSum;
    property sum1 : TXSDecimal read Fsum1 write Fsum1;
    property sum2 : TXSDecimal read Fsum2 write Fsum2;
    property sum3 : TXSDecimal read Fsum3 write Fsum3;
    property sum4 : TXSDecimal read Fsum4 write Fsum4;
    property sum5 : TXSDecimal read Fsum5 write Fsum5;
    property sum6 : TXSDecimal read Fsum6 write Fsum6;	
    property sum7 : TXSDecimal read Fsum7 write Fsum7;
    property sum1dec1 : TXSDecimal read Fsum1dec1 write Fsum1dec1;
    property sum2dec1 : TXSDecimal read Fsum2dec1 write Fsum2dec1;
    property sum3dec1 : TXSDecimal read Fsum3dec1 write Fsum3dec1;
    property sum4dec1 : TXSDecimal read Fsum4dec1 write Fsum4dec1;
    property sum5dec1 : TXSDecimal read Fsum5dec1 write Fsum5dec1;
    property sum6dec1 : TXSDecimal read Fsum6dec1 write Fsum6dec1;	
    property sum7dec1 : TXSDecimal read Fsum7dec1 write Fsum7dec1;
    property sum1dec2 : TXSDecimal read Fsum1dec2 write Fsum1dec2;
    property sum2dec2 : TXSDecimal read Fsum2dec2 write Fsum2dec2;
    property sum3dec2 : TXSDecimal read Fsum3dec2 write Fsum3dec2;
    property sum4dec2 : TXSDecimal read Fsum4dec2 write Fsum4dec2;
    property sum5dec2 : TXSDecimal read Fsum5dec2 write Fsum5dec2;
    property sum6dec2 : TXSDecimal read Fsum6dec2 write Fsum6dec2;	
    property sum7dec2 : TXSDecimal read Fsum7dec2 write Fsum7dec2;
    property sum1dec3 : TXSDecimal read Fsum1dec3 write Fsum1dec3;
    property sum2dec3 : TXSDecimal read Fsum2dec3 write Fsum2dec3;
    property sum3dec3 : TXSDecimal read Fsum3dec3 write Fsum3dec3;
    property sum4dec3 : TXSDecimal read Fsum4dec3 write Fsum4dec3;
    property sum5dec3 : TXSDecimal read Fsum5dec3 write Fsum5dec3;
    property sum6dec3 : TXSDecimal read Fsum6dec3 write Fsum6dec3;	
    property sum7dec3 : TXSDecimal read Fsum7dec3 write Fsum7dec3;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property fuelTypeRefCode : Integer read FfuelTypeRefCode write FfuelTypeRefCode;
    property fuelTypeRefName : WideString read FfuelTypeRefName write FfuelTypeRefName;
  end;

  ArrayOfENFuelDistributionSheetShort = array of ENFuelDistributionSheetShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENFuelDistributionSheetShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENFuelDistributionSheetShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENFuelDistributionSheetShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENFuelDistributionSheetController/message/
  // soapAction: http://ksoe.org/ENFuelDistributionSheetController/action/ENFuelDistributionSheetController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENFuelDistributionSheetControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENFuelDistributionSheetController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENFuelDistributionSheetControllerSoapPort = interface(IInvokable)
  ['{1e421e42-1e42-1e42-1e42-1e421e421e42}']
    function add(const aENFuelDistributionSheet: ENFuelDistributionSheet): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENFuelDistributionSheet: ENFuelDistributionSheet); stdcall;
    function getObject(const anObjectCode: Integer): ENFuelDistributionSheet; stdcall;
    function getList: ENFuelDistributionSheetShortList; stdcall;
    function getFilteredList(const aENFuelDistributionSheetFilter: ENFuelDistributionSheetFilter): ENFuelDistributionSheetShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENFuelDistributionSheetShortList; stdcall;
    function getScrollableFilteredList(const aENFuelDistributionSheetFilter: ENFuelDistributionSheetFilter; const aFromPosition: Integer; const aQuantity: Integer): ENFuelDistributionSheetShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENFuelDistributionSheetShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENFuelDistributionSheetFilter: ENFuelDistributionSheetFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENFuelDistributionSheetShort; stdcall;
    function recalcApprovedPmmByTypeActivity(const aENFuelDistributionSheet: ENFuelDistributionSheet; const activityType: Integer; const decadesToCalculate: ArrayOfInteger): ENFuelDistributionSheet; stdcall;
  end;


implementation

  destructor ENFuelDistributionSheet.Destroy;
  begin
    if Assigned(FtotalSum) then
      totalSum.Free;
    if Assigned(Fsum1) then
      sum1.Free;
    if Assigned(Fsum2) then
      sum2.Free;
    if Assigned(Fsum3) then
      sum3.Free;
    if Assigned(Fsum4) then
      sum4.Free;
    if Assigned(Fsum5) then
      sum5.Free;
    if Assigned(Fsum6) then
      sum6.Free;	  
    if Assigned(Fsum7) then
      sum7.Free;
    if Assigned(Fsum1dec1) then
      sum1dec1.Free;
    if Assigned(Fsum2dec1) then
      sum2dec1.Free;
    if Assigned(Fsum3dec1) then
      sum3dec1.Free;
    if Assigned(Fsum4dec1) then
      sum4dec1.Free;
    if Assigned(Fsum5dec1) then
      sum5dec1.Free;
    if Assigned(Fsum6dec1) then
      sum6dec1.Free;	  
    if Assigned(Fsum7dec1) then
      sum7dec1.Free;
    if Assigned(Fsum1dec2) then
      sum1dec2.Free;
    if Assigned(Fsum2dec2) then
      sum2dec2.Free;
    if Assigned(Fsum3dec2) then
      sum3dec2.Free;
    if Assigned(Fsum4dec2) then
      sum4dec2.Free;
    if Assigned(Fsum5dec2) then
      sum5dec2.Free;
    if Assigned(Fsum6dec2) then
      sum6dec2.Free;	  
    if Assigned(Fsum7dec2) then
      sum7dec2.Free;
    if Assigned(Fsum1dec3) then
      sum1dec3.Free;
    if Assigned(Fsum2dec3) then
      sum2dec3.Free;
    if Assigned(Fsum3dec3) then
      sum3dec3.Free;
    if Assigned(Fsum4dec3) then
      sum4dec3.Free;
    if Assigned(Fsum5dec3) then
      sum5dec3.Free;
    if Assigned(Fsum6dec3) then
      sum6dec3.Free;	  
    if Assigned(Fsum7dec3) then
      sum7dec3.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfuelTypeRef) then
      fuelTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENFuelDistributionSheetFilter.Destroy;
  begin
    if Assigned(FtotalSum) then
      totalSum.Free;
    if Assigned(Fsum1) then
      sum1.Free;
    if Assigned(Fsum2) then
      sum2.Free;
    if Assigned(Fsum3) then
      sum3.Free;
    if Assigned(Fsum4) then
      sum4.Free;
    if Assigned(Fsum5) then
      sum5.Free;
    if Assigned(Fsum6) then
      sum6.Free;
    if Assigned(Fsum7) then
      sum7.Free;
    if Assigned(Fsum1dec1) then
      sum1dec1.Free;
    if Assigned(Fsum2dec1) then
      sum2dec1.Free;
    if Assigned(Fsum3dec1) then
      sum3dec1.Free;
    if Assigned(Fsum4dec1) then
      sum4dec1.Free;
    if Assigned(Fsum5dec1) then
      sum5dec1.Free;
    if Assigned(Fsum6dec1) then
      sum6dec1.Free;
    if Assigned(Fsum7dec1) then
      sum7dec1.Free;
    if Assigned(Fsum1dec2) then
      sum1dec2.Free;
    if Assigned(Fsum2dec2) then
      sum2dec2.Free;
    if Assigned(Fsum3dec2) then
      sum3dec2.Free;
    if Assigned(Fsum4dec2) then
      sum4dec2.Free;
    if Assigned(Fsum5dec2) then
      sum5dec2.Free;
    if Assigned(Fsum6dec2) then
      sum6dec2.Free;
    if Assigned(Fsum7dec2) then
      sum7dec2.Free;
    if Assigned(Fsum1dec3) then
      sum1dec3.Free;
    if Assigned(Fsum2dec3) then
      sum2dec3.Free;
    if Assigned(Fsum3dec3) then
      sum3dec3.Free;
    if Assigned(Fsum4dec3) then
      sum4dec3.Free;
    if Assigned(Fsum5dec3) then
      sum5dec3.Free;
    if Assigned(Fsum6dec3) then
      sum6dec3.Free;
    if Assigned(Fsum7dec3) then
      sum7dec3.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfuelTypeRef) then
      fuelTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENFuelDistributionSheetFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENFuelDistributionSheetShort.Destroy;
  begin
    if Assigned(FtotalSum) then
      totalSum.Free;
    if Assigned(Fsum1) then
      sum1.Free;
    if Assigned(Fsum2) then
      sum2.Free;
    if Assigned(Fsum3) then
      sum3.Free;
    if Assigned(Fsum4) then
      sum4.Free;
    if Assigned(Fsum5) then
      sum5.Free;
    if Assigned(Fsum6) then
      sum6.Free;
    if Assigned(Fsum7) then
      sum7.Free;
    if Assigned(Fsum1dec1) then
      sum1dec1.Free;
    if Assigned(Fsum2dec1) then
      sum2dec1.Free;
    if Assigned(Fsum3dec1) then
      sum3dec1.Free;
    if Assigned(Fsum4dec1) then
      sum4dec1.Free;
    if Assigned(Fsum5dec1) then
      sum5dec1.Free;
    if Assigned(Fsum6dec1) then
      sum6dec1.Free;
    if Assigned(Fsum7dec1) then
      sum7dec1.Free;
    if Assigned(Fsum1dec2) then
      sum1dec2.Free;
    if Assigned(Fsum2dec2) then
      sum2dec2.Free;
    if Assigned(Fsum3dec2) then
      sum3dec2.Free;
    if Assigned(Fsum4dec2) then
      sum4dec2.Free;
    if Assigned(Fsum5dec2) then
      sum5dec2.Free;
    if Assigned(Fsum6dec2) then
      sum6dec2.Free;
    if Assigned(Fsum7dec2) then
      sum7dec2.Free;
    if Assigned(Fsum1dec3) then
      sum1dec3.Free;
    if Assigned(Fsum2dec3) then
      sum2dec3.Free;
    if Assigned(Fsum3dec3) then
      sum3dec3.Free;
    if Assigned(Fsum4dec3) then
      sum4dec3.Free;
    if Assigned(Fsum5dec3) then
      sum5dec3.Free;
    if Assigned(Fsum6dec3) then
      sum6dec3.Free;
    if Assigned(Fsum7dec3) then
      sum7dec3.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

  destructor ENFuelDistributionSheetShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENFuelDistributionSheet, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelDistributionSheet');
  RemClassRegistry.RegisterXSClass(ENFuelDistributionSheetRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelDistributionSheetRef');
  RemClassRegistry.RegisterXSClass(ENFuelDistributionSheetFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelDistributionSheetFilter');
  RemClassRegistry.RegisterXSClass(ENFuelDistributionSheetShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelDistributionSheetShort');
  RemClassRegistry.RegisterXSClass(ENFuelDistributionSheetShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelDistributionSheetShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENFuelDistributionSheetShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENFuelDistributionSheetShort');

  InvRegistry.RegisterInterface(TypeInfo(ENFuelDistributionSheetControllerSoapPort), 'http://ksoe.org/ENFuelDistributionSheetController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENFuelDistributionSheetControllerSoapPort), 'http://ksoe.org/ENFuelDistributionSheetController/action/ENFuelDistributionSheetController.%operationName%');


end.
