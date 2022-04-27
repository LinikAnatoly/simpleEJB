unit ENReconstrModern2OSDataController;

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

  ENReconstrModern2OSData            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENReconstrModern2OSDataRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENReconstrModern2OSData = class(TRemotable)
  private
    Fcode : Integer; 
    Fnum_un : Integer; 
    Fnum_dovvod : Integer; 
    Fdate_dovvod : TXSDate;
    Fkod_inv : WideString;
    Fkod_ist : WideString;
    Fname_ist : WideString;
    Fsum_dovvod_n : TXSDecimal;
    Fsum_dovvod_b : TXSDecimal;
    Fsum_nds : TXSDecimal;
    Fsum_dovvod_nds_b : TXSDecimal;
    Fsum_dovvod_izn_n : TXSDecimal;
    Fsum_dovvod_izn_b : TXSDecimal;
    Fname_dovvod : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;	
    Fkod_nakl : WideString;
    Fdt_nakl : TXSDateTime;	
    Fkod_nal_nakl : WideString;
    Fkod_postav : WideString;
    Fkod_dogovor : WideString;
    FdateBuh : TXSDateTime;	
    Fmodify_time : Int64;
//???
    FENReconstrModernOZRef : ENReconstrModernOZRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  num_un : Integer read Fnum_un write Fnum_un; 
    property  num_dovvod : Integer read Fnum_dovvod write Fnum_dovvod; 
    property date_dovvod : TXSDate read Fdate_dovvod write Fdate_dovvod;
    property kod_inv : WideString read Fkod_inv write Fkod_inv;
    property kod_ist : WideString read Fkod_ist write Fkod_ist;
    property name_ist : WideString read Fname_ist write Fname_ist;
    property sum_dovvod_n : TXSDecimal read Fsum_dovvod_n write Fsum_dovvod_n; 
    property sum_dovvod_b : TXSDecimal read Fsum_dovvod_b write Fsum_dovvod_b; 
    property sum_nds : TXSDecimal read Fsum_nds write Fsum_nds; 
    property sum_dovvod_nds_b : TXSDecimal read Fsum_dovvod_nds_b write Fsum_dovvod_nds_b; 
    property sum_dovvod_izn_n : TXSDecimal read Fsum_dovvod_izn_n write Fsum_dovvod_izn_n; 
    property sum_dovvod_izn_b : TXSDecimal read Fsum_dovvod_izn_b write Fsum_dovvod_izn_b; 
    property name_dovvod : WideString read Fname_dovvod write Fname_dovvod;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property kod_nakl : WideString read Fkod_nakl write Fkod_nakl;
    property dt_nakl : TXSDateTime read Fdt_nakl write Fdt_nakl;	
    property kod_nal_nakl : WideString read Fkod_nal_nakl write Fkod_nal_nakl;
    property kod_postav : WideString read Fkod_postav write Fkod_postav;
    property kod_dogovor : WideString read Fkod_dogovor write Fkod_dogovor;
    property dateBuh : TXSDateTime read FdateBuh write FdateBuh;	
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property ENReconstrModernOZRef : ENReconstrModernOZRef read FENReconstrModernOZRef write FENReconstrModernOZRef; 
  end;
  
{
  ENReconstrModern2OSDataFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fnum_un : Integer; 
    Fnum_dovvod : Integer; 
    Fdate_dovvod : TXSDate;
    Fkod_inv : WideString;
    Fkod_ist : WideString;
    Fname_ist : WideString;
    Fsum_dovvod_n : TXSDecimal;
    Fsum_dovvod_b : TXSDecimal;
    Fsum_nds : TXSDecimal;
    Fsum_dovvod_nds_b : TXSDecimal;
    Fsum_dovvod_izn_n : TXSDecimal;
    Fsum_dovvod_izn_b : TXSDecimal;
    Fname_dovvod : WideString;
    FuserGen : WideString;
    FdateEdit : DateTime; 
    Fkod_nakl : WideString;
    Fdt_nakl : DateTime; 
    Fkod_nal_nakl : WideString;
    Fkod_postav : WideString;
    Fkod_dogovor : WideString;
    FdateBuh : DateTime; 
    Fmodify_time : Int64;
//???
    FENReconstrModernOZRef : ENReconstrModernOZRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property  num_un : Integer read Fnum_un write Fnum_un; 
    property  num_dovvod : Integer read Fnum_dovvod write Fnum_dovvod; 
    property date_dovvod : TXSDate read Fdate_dovvod write Fdate_dovvod;
    property kod_inv : WideString read Fkod_inv write Fkod_inv;
    property kod_ist : WideString read Fkod_ist write Fkod_ist;
    property name_ist : WideString read Fname_ist write Fname_ist;
    property sum_dovvod_n : TXSDecimal read Fsum_dovvod_n write Fsum_dovvod_n; 
    property sum_dovvod_b : TXSDecimal read Fsum_dovvod_b write Fsum_dovvod_b; 
    property sum_nds : TXSDecimal read Fsum_nds write Fsum_nds; 
    property sum_dovvod_nds_b : TXSDecimal read Fsum_dovvod_nds_b write Fsum_dovvod_nds_b; 
    property sum_dovvod_izn_n : TXSDecimal read Fsum_dovvod_izn_n write Fsum_dovvod_izn_n; 
    property sum_dovvod_izn_b : TXSDecimal read Fsum_dovvod_izn_b write Fsum_dovvod_izn_b; 
    property name_dovvod : WideString read Fname_dovvod write Fname_dovvod;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime; 
    property kod_nakl : WideString read Fkod_nakl write Fkod_nakl;
    property dt_nakl : DateTime; 
    property kod_nal_nakl : WideString read Fkod_nal_nakl write Fkod_nal_nakl;
    property kod_postav : WideString read Fkod_postav write Fkod_postav;
    property kod_dogovor : WideString read Fkod_dogovor write Fkod_dogovor;
    property dateBuh : DateTime; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property ENReconstrModernOZRef : ENReconstrModernOZRef read FENReconstrModernOZRef write FENReconstrModernOZRef; 
  end;
}

  ENReconstrModern2OSDataFilter = class(ENReconstrModern2OSData)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENReconstrModern2OSDataShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fnum_un : Integer; 
    Fnum_dovvod : Integer; 
    Fdate_dovvod : TXSDate;	
    Fkod_inv : WideString;
    Fkod_ist : WideString;
    Fname_ist : WideString;
    Fsum_dovvod_n : TXSDecimal;
    Fsum_dovvod_b : TXSDecimal;
    Fsum_nds : TXSDecimal;
    Fsum_dovvod_nds_b : TXSDecimal;
    Fsum_dovvod_izn_n : TXSDecimal;
    Fsum_dovvod_izn_b : TXSDecimal;
    Fname_dovvod : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fkod_nakl : WideString;
    Fdt_nakl : TXSDateTime;
    Fkod_nal_nakl : WideString;
    Fkod_postav : WideString;
    Fkod_dogovor : WideString;
    FdateBuh : TXSDateTime;
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
    FENReconstrModernOZRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  num_un : Integer read Fnum_un write Fnum_un; 
    property  num_dovvod : Integer read Fnum_dovvod write Fnum_dovvod; 
    property date_dovvod : TXSDate read Fdate_dovvod write Fdate_dovvod;
    property kod_inv : WideString read Fkod_inv write Fkod_inv;
    property kod_ist : WideString read Fkod_ist write Fkod_ist;
    property name_ist : WideString read Fname_ist write Fname_ist;
    property sum_dovvod_n : TXSDecimal read Fsum_dovvod_n write Fsum_dovvod_n; 
    property sum_dovvod_b : TXSDecimal read Fsum_dovvod_b write Fsum_dovvod_b; 
    property sum_nds : TXSDecimal read Fsum_nds write Fsum_nds; 
    property sum_dovvod_nds_b : TXSDecimal read Fsum_dovvod_nds_b write Fsum_dovvod_nds_b; 
    property sum_dovvod_izn_n : TXSDecimal read Fsum_dovvod_izn_n write Fsum_dovvod_izn_n; 
    property sum_dovvod_izn_b : TXSDecimal read Fsum_dovvod_izn_b write Fsum_dovvod_izn_b; 
    property name_dovvod : WideString read Fname_dovvod write Fname_dovvod;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property kod_nakl : WideString read Fkod_nakl write Fkod_nakl;
    property dt_nakl : TXSDateTime read Fdt_nakl write Fdt_nakl;	
    property kod_nal_nakl : WideString read Fkod_nal_nakl write Fkod_nal_nakl;
    property kod_postav : WideString read Fkod_postav write Fkod_postav;
    property kod_dogovor : WideString read Fkod_dogovor write Fkod_dogovor;
    property dateBuh : TXSDateTime read FdateBuh write FdateBuh;	

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
    property ENReconstrModernOZRefUserGen : WideString read FENReconstrModernOZRefUserGen write FENReconstrModernOZRefUserGen; 
  end;

  ArrayOfENReconstrModern2OSDataShort = array of ENReconstrModern2OSDataShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENReconstrModern2OSDataShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENReconstrModern2OSDataShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENReconstrModern2OSDataShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENReconstrModern2OSDataController/message/
  // soapAction: http://ksoe.org/ENReconstrModern2OSDataController/action/ENReconstrModern2OSDataController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENReconstrModern2OSDataControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENReconstrModern2OSDataController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENReconstrModern2OSDataControllerSoapPort = interface(IInvokable)
  ['{1e6c1e6c-1e6c-1e6c-1e6c-1e6c1e6c1e6c}']
    function  add(const aENReconstrModern2OSData: ENReconstrModern2OSData): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENReconstrModern2OSData: ENReconstrModern2OSData); stdcall;
    function  getObject(const anObjectCode: Integer): ENReconstrModern2OSData; stdcall;
    function  getList: ENReconstrModern2OSDataShortList; stdcall;
    function  getFilteredList(const aENReconstrModern2OSDataFilter: ENReconstrModern2OSDataFilter): ENReconstrModern2OSDataShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENReconstrModern2OSDataShortList; stdcall;
    function  getScrollableFilteredList(const aENReconstrModern2OSDataFilter: ENReconstrModern2OSDataFilter; const aFromPosition: Integer; const aQuantity: Integer): ENReconstrModern2OSDataShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENReconstrModern2OSDataShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENReconstrModern2OSDataFilter: ENReconstrModern2OSDataFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENReconstrModern2OSData.Destroy;
  begin
    if Assigned(Fdate_dovvod) then
      date_dovvod.Free;
    if Assigned(Fsum_dovvod_n) then
      sum_dovvod_n.Free;
    if Assigned(Fsum_dovvod_b) then
      sum_dovvod_b.Free;
    if Assigned(Fsum_nds) then
      sum_nds.Free;
    if Assigned(Fsum_dovvod_nds_b) then
      sum_dovvod_nds_b.Free;
    if Assigned(Fsum_dovvod_izn_n) then
      sum_dovvod_izn_n.Free;
    if Assigned(Fsum_dovvod_izn_b) then
      sum_dovvod_izn_b.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fdt_nakl) then
      dt_nakl.Free;
    if Assigned(FdateBuh) then
      dateBuh.Free;
    if Assigned(FENReconstrModernOZRef) then
      ENReconstrModernOZRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENReconstrModern2OSDataFilter.Destroy;
  begin
    if Assigned(Fdate_dovvod) then
      date_dovvod.Free;
    if Assigned(Fsum_dovvod_n) then
      sum_dovvod_n.Free;
    if Assigned(Fsum_dovvod_b) then
      sum_dovvod_b.Free;
    if Assigned(Fsum_nds) then
      sum_nds.Free;
    if Assigned(Fsum_dovvod_nds_b) then
      sum_dovvod_nds_b.Free;
    if Assigned(Fsum_dovvod_izn_n) then
      sum_dovvod_izn_n.Free;
    if Assigned(Fsum_dovvod_izn_b) then
      sum_dovvod_izn_b.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fdt_nakl) then
      dt_nakl.Free;
    if Assigned(FdateBuh) then
      dateBuh.Free;
    if Assigned(FENReconstrModernOZRef) then
      ENReconstrModernOZRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENReconstrModern2OSDataFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENReconstrModern2OSDataShort.Destroy;
  begin
    if Assigned(Fdate_dovvod) then
      date_dovvod.Free;
    if Assigned(Fsum_dovvod_n) then
      sum_dovvod_n.Free;
    if Assigned(Fsum_dovvod_b) then
      sum_dovvod_b.Free;
    if Assigned(Fsum_nds) then
      sum_nds.Free;
    if Assigned(Fsum_dovvod_nds_b) then
      sum_dovvod_nds_b.Free;
    if Assigned(Fsum_dovvod_izn_n) then
      sum_dovvod_izn_n.Free;
    if Assigned(Fsum_dovvod_izn_b) then
      sum_dovvod_izn_b.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fdt_nakl) then
      dt_nakl.Free;
    if Assigned(FdateBuh) then
      dateBuh.Free;
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
  
  destructor ENReconstrModern2OSDataShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENReconstrModern2OSData, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModern2OSData');
  RemClassRegistry.RegisterXSClass(ENReconstrModern2OSDataRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModern2OSDataRef');
  RemClassRegistry.RegisterXSClass(ENReconstrModern2OSDataFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModern2OSDataFilter');
  RemClassRegistry.RegisterXSClass(ENReconstrModern2OSDataShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModern2OSDataShort');
  RemClassRegistry.RegisterXSClass(ENReconstrModern2OSDataShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReconstrModern2OSDataShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENReconstrModern2OSDataShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENReconstrModern2OSDataShort');

  InvRegistry.RegisterInterface(TypeInfo(ENReconstrModern2OSDataControllerSoapPort), 'http://ksoe.org/ENReconstrModern2OSDataController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENReconstrModern2OSDataControllerSoapPort), 'http://ksoe.org/ENReconstrModern2OSDataController/action/ENReconstrModern2OSDataController.%operationName%');


end.
