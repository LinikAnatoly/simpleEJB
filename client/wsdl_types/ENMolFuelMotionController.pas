unit ENMolFuelMotionController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENMolFuelMotionTypeController
   ,TKFuelTypeController
   ,RQFKOrderController
   ,ENActController
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

  ENMolFuelMotion            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMolFuelMotionRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMolFuelMotion = class(TRemotable)
  private
    Fcode : Integer;
    Fmolcode : WideString;
    Fmolname : WideString;
    FdateGen : TXSDate;
    Fnn : WideString;
    Fmat_name : WideString;
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FmotionTypeRef : ENMolFuelMotionTypeRef;
//???
    FfuelTypeRef : TKFuelTypeRef;
//???
    FfkorderRef : RQFKOrderRef;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property molcode : WideString read Fmolcode write Fmolcode;
    property molname : WideString read Fmolname write Fmolname;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property nn : WideString read Fnn write Fnn;
    property mat_name : WideString read Fmat_name write Fmat_name;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property motionTypeRef : ENMolFuelMotionTypeRef read FmotionTypeRef write FmotionTypeRef;
    property fuelTypeRef : TKFuelTypeRef read FfuelTypeRef write FfuelTypeRef;
    property fkorderRef : RQFKOrderRef read FfkorderRef write FfkorderRef;
    property actRef : ENActRef read FactRef write FactRef;
  end;

{
  ENMolFuelMotionFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fmolcode : WideString;
    Fmolname : WideString;
    FdateGen : TXSDate;
    Fnn : WideString;
    Fmat_name : WideString;
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FmotionTypeRef : ENMolFuelMotionTypeRef;
//???
    FfuelTypeRef : TKFuelTypeRef;
//???
    FfkorderRef : RQFKOrderRef;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property molcode : WideString read Fmolcode write Fmolcode;
    property molname : WideString read Fmolname write Fmolname;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property nn : WideString read Fnn write Fnn;
    property mat_name : WideString read Fmat_name write Fmat_name;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property motionTypeRef : ENMolFuelMotionTypeRef read FmotionTypeRef write FmotionTypeRef;
    property fuelTypeRef : TKFuelTypeRef read FfuelTypeRef write FfuelTypeRef;
    property fkorderRef : RQFKOrderRef read FfkorderRef write FfkorderRef;
    property actRef : ENActRef read FactRef write FactRef;
  end;
}

  ENMolFuelMotionFilter = class(ENMolFuelMotion)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENMolFuelMotionShort = class(TRemotable)
  private
    Fcode : Integer;
    Fmolcode : WideString;
    Fmolname : WideString;
    FdateGen : TXSDate;
    Fnn : WideString;
    Fmat_name : WideString;
    FcountGen : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FmotionTypeRefCode : Integer;
    FmotionTypeRefName : WideString;
    FfuelTypeRefCode : Integer;
    FfuelTypeRefName : WideString;
    FfkorderRefCode : Integer;
    FfkorderRefNumberDoc : WideString;
    FfkorderRefDateGen : TXSDate;
    FfkorderRefDateShipment : TXSDate;
    FfkorderRefMolOutCode : WideString;
    FfkorderRefMolOutName : WideString;
    FfkorderRefMolInCode : WideString;
    FfkorderRefMolInName : WideString;
    FfkorderRefExpeditorCode : WideString;
    FfkorderRefExpeditorName : WideString;
    FfkorderRefWarrantNumber : WideString;
    FfkorderRefWarrantDate : TXSDate;
    FfkorderRefWarrantFIO : WideString;
    FfkorderRefSumWithoutNds : TXSDecimal;
    FfkorderRefSumNds : TXSDecimal;
    FfkorderRefNdsPercent : Integer;
    FfkorderRefDateAdd : TXSDateTime;
    FfkorderRefUserAdd : WideString;
    FfkorderRefDateEdit : TXSDateTime;
    FfkorderRefUserGen : WideString;
    FactRefCode : Integer;
    FactRefNumberGen : WideString;
    FactRefDateGen : TXSDate;
    FactRefFinDocCode : Integer;
    FactRefFinDocMechanicCode : Integer;
    FactRefFinMolName : WideString;
    FactRefFinMechanicName : WideString;
    FactRefInvNumber : WideString;
    FactRefUserGen : WideString;
    FactRefDateEdit : TXSDate;
    FactRefDateAct : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property molcode : WideString read Fmolcode write Fmolcode;
    property molname : WideString read Fmolname write Fmolname;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property nn : WideString read Fnn write Fnn;
    property mat_name : WideString read Fmat_name write Fmat_name;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property motionTypeRefCode : Integer read FmotionTypeRefCode write FmotionTypeRefCode;
    property motionTypeRefName : WideString read FmotionTypeRefName write FmotionTypeRefName;
    property fuelTypeRefCode : Integer read FfuelTypeRefCode write FfuelTypeRefCode;
    property fuelTypeRefName : WideString read FfuelTypeRefName write FfuelTypeRefName;
    property fkorderRefCode : Integer read FfkorderRefCode write FfkorderRefCode;
    property fkorderRefNumberDoc : WideString read FfkorderRefNumberDoc write FfkorderRefNumberDoc;
    property fkorderRefDateGen : TXSDate read FfkorderRefDateGen write FfkorderRefDateGen;
    property fkorderRefDateShipment : TXSDate read FfkorderRefDateShipment write FfkorderRefDateShipment;
    property fkorderRefMolOutCode : WideString read FfkorderRefMolOutCode write FfkorderRefMolOutCode;
    property fkorderRefMolOutName : WideString read FfkorderRefMolOutName write FfkorderRefMolOutName;
    property fkorderRefMolInCode : WideString read FfkorderRefMolInCode write FfkorderRefMolInCode;
    property fkorderRefMolInName : WideString read FfkorderRefMolInName write FfkorderRefMolInName;
    property fkorderRefExpeditorCode : WideString read FfkorderRefExpeditorCode write FfkorderRefExpeditorCode;
    property fkorderRefExpeditorName : WideString read FfkorderRefExpeditorName write FfkorderRefExpeditorName;
    property fkorderRefWarrantNumber : WideString read FfkorderRefWarrantNumber write FfkorderRefWarrantNumber;
    property fkorderRefWarrantDate : TXSDate read FfkorderRefWarrantDate write FfkorderRefWarrantDate;
    property fkorderRefWarrantFIO : WideString read FfkorderRefWarrantFIO write FfkorderRefWarrantFIO;
    property fkorderRefSumWithoutNds : TXSDecimal read FfkorderRefSumWithoutNds write FfkorderRefSumWithoutNds;
    property fkorderRefSumNds : TXSDecimal read FfkorderRefSumNds write FfkorderRefSumNds;
    property fkorderRefNdsPercent : Integer read FfkorderRefNdsPercent write FfkorderRefNdsPercent;
    property fkorderRefDateAdd : TXSDateTime read FfkorderRefDateAdd write FfkorderRefDateAdd;
    property fkorderRefUserAdd : WideString read FfkorderRefUserAdd write FfkorderRefUserAdd;
    property fkorderRefDateEdit : TXSDateTime read FfkorderRefDateEdit write FfkorderRefDateEdit;
    property fkorderRefUserGen : WideString read FfkorderRefUserGen write FfkorderRefUserGen;
    property actRefCode : Integer read FactRefCode write FactRefCode;
    property actRefNumberGen : WideString read FactRefNumberGen write FactRefNumberGen;
    property actRefDateGen : TXSDate read FactRefDateGen write FactRefDateGen;
    property actRefFinDocCode : Integer read FactRefFinDocCode write FactRefFinDocCode;
    property actRefFinDocMechanicCode : Integer read FactRefFinDocMechanicCode write FactRefFinDocMechanicCode;
    property actRefFinMolName : WideString read FactRefFinMolName write FactRefFinMolName;
    property actRefFinMechanicName : WideString read FactRefFinMechanicName write FactRefFinMechanicName;
    property actRefInvNumber : WideString read FactRefInvNumber write FactRefInvNumber;
    property actRefUserGen : WideString read FactRefUserGen write FactRefUserGen;
    property actRefDateEdit : TXSDate read FactRefDateEdit write FactRefDateEdit;
    property actRefDateAct : TXSDate read FactRefDateAct write FactRefDateAct;
  end;

  ArrayOfENMolFuelMotionShort = array of ENMolFuelMotionShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMolFuelMotionShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMolFuelMotionShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMolFuelMotionShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMolFuelMotionController/message/
  // soapAction: http://ksoe.org/ENMolFuelMotionController/action/ENMolFuelMotionController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMolFuelMotionControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMolFuelMotionController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMolFuelMotionControllerSoapPort = interface(IInvokable)
  ['{b184b184-b184-b184-b184-b184b184b184}']
    function add(const aENMolFuelMotion: ENMolFuelMotion): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMolFuelMotion: ENMolFuelMotion); stdcall;
    function getObject(const anObjectCode: Integer): ENMolFuelMotion; stdcall;
    function getList: ENMolFuelMotionShortList; stdcall;
    function getFilteredList(const aENMolFuelMotionFilter: ENMolFuelMotionFilter): ENMolFuelMotionShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMolFuelMotionShortList; stdcall;
    function getScrollableFilteredList(const aENMolFuelMotionFilter: ENMolFuelMotionFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMolFuelMotionShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMolFuelMotionShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENMolFuelMotionFilter: ENMolFuelMotionFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENMolFuelMotionShort; stdcall;
  end;


implementation

  destructor ENMolFuelMotion.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FmotionTypeRef) then
      motionTypeRef.Free;
    if Assigned(FfuelTypeRef) then
      fuelTypeRef.Free;
    if Assigned(FfkorderRef) then
      fkorderRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;

{
  destructor ENMolFuelMotionFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FmotionTypeRef) then
      motionTypeRef.Free;
    if Assigned(FfuelTypeRef) then
      fuelTypeRef.Free;
    if Assigned(FfkorderRef) then
      fkorderRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;
}

  destructor ENMolFuelMotionFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENMolFuelMotionShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfkorderRefDateGen) then
      fkorderRefDateGen.Free;
    if Assigned(FfkorderRefDateShipment) then
      fkorderRefDateShipment.Free;
    if Assigned(FfkorderRefWarrantDate) then
      fkorderRefWarrantDate.Free;
    if Assigned(FfkorderRefSumWithoutNds) then
      fkorderRefSumWithoutNds.Free;
    if Assigned(FfkorderRefSumNds) then
      fkorderRefSumNds.Free;
    if Assigned(FfkorderRefDateAdd) then
      fkorderRefDateAdd.Free;
    if Assigned(FfkorderRefDateEdit) then
      fkorderRefDateEdit.Free;
    if Assigned(FactRefDateGen) then
      actRefDateGen.Free;
    if Assigned(FactRefDateEdit) then
      actRefDateEdit.Free;
    if Assigned(FactRefDateAct) then
      actRefDateAct.Free;
    inherited Destroy;
  end;

  destructor ENMolFuelMotionShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMolFuelMotion, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolFuelMotion');
  RemClassRegistry.RegisterXSClass(ENMolFuelMotionRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolFuelMotionRef');
  RemClassRegistry.RegisterXSClass(ENMolFuelMotionFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolFuelMotionFilter');
  RemClassRegistry.RegisterXSClass(ENMolFuelMotionShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolFuelMotionShort');
  RemClassRegistry.RegisterXSClass(ENMolFuelMotionShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolFuelMotionShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMolFuelMotionShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMolFuelMotionShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMolFuelMotionControllerSoapPort), 'http://ksoe.org/ENMolFuelMotionController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMolFuelMotionControllerSoapPort), 'http://ksoe.org/ENMolFuelMotionController/action/ENMolFuelMotionController.%operationName%');


end.
