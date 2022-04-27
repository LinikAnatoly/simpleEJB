unit ENReportsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
, EnergyProController, EnergyProController2
;

type

{
EPReportRequestEx    = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }
{
ArrayOfString = array of WideString;          { "http://ksoe.org/EnergyproControllerService/type/" }
{
  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  EPReportRequestEx = class(TRemotable)
  private
    FargNames: ArrayOfString;
    FreportCode: Integer;
    FfuncName: WideString;
    Fargs: ArrayOfString;
    FresultType: Integer;
  published
    property argNames: ArrayOfString read FargNames write FargNames;
    property reportCode: Integer read FreportCode write FreportCode;
    property funcName: WideString read FfuncName write FfuncName;
    property args: ArrayOfString read Fargs write Fargs;
    property resultType: Integer read FresultType write FresultType;
  end;
}
  // ************************************************************************ //
  // Namespace : http://ksoe.org/EPReportController/message/
  // soapAction: http://ksoe.org/EPReportController/action/EPReportController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : EPReportControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : EPReportController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //

  AnswerFileDodatokOk        = class;                 { "http://ksoe.org/EPReportController/type/" }
  AnswerFileDodatokOkList    = class;                 { "http://ksoe.org/EPReportController/type/" }



  AnswerFileDodatokOk = class(TRemotable)
  private
    Fname_pr : WideString;
    Finn: WideString;
    Fsm: TXSDecimal;
    Ftype_pr: WideString;
    Ftype_sm: WideString;
  published
    property name_pr: WideString read Fname_pr write Fname_pr;
    property inn: WideString read Finn write Finn;
    property sm: TXSDecimal read Fsm write Fsm;
    property type_pr: WideString read Ftype_pr write Ftype_pr;
    property type_sm: WideString read Ftype_sm write Ftype_sm;

  end;

  ArrayOfAnswerFileDodatokOk = array of AnswerFileDodatokOk;   { "http://ksoe.org/EPReportController/type/" }


  AnswerFileDodatokOkList = class(TRemotable)
  private
    Flist: ArrayOfAnswerFileDodatokOk;
    Fyear: WideString;
    FmonthStart: WideString;
    FmonthFinal: WideString;
  published
    property list: ArrayOfAnswerFileDodatokOk read Flist write Flist;
    property year: WideString read Fyear write Fyear;
    property monthStart: WideString read FmonthStart write FmonthStart;
    property monthFinal: WideString read FmonthFinal write FmonthFinal;
  end;

  ArrayOfByte = array of Byte;

  ENReportControllerSoapPort = interface(IInvokable)
['{681454AC-0E37-43FA-8133-EAD9102C4A51}']
{
    function  add(const aEPReport: EPReport): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aEPReport: EPReport); stdcall;
    function  getObject(const anObjectCode: Integer): EPReport; stdcall;
    function  getList: EPReportShortList; stdcall;
    function  getFilteredList(const aEPReportFilter: EPReportFilter): EPReportShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): EPReportShortList; stdcall;
    function  getScrollableFilteredList(const aEPReportFilter: EPReportFilter; const aFromPosition: Integer; const aQuantity: Integer): EPReportShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): EPReportShortList; stdcall;
    function  process(const request: EPReportRequest): WideString; stdcall;
    function  getVersionInfo: EPVersionInfo; stdcall;
}
    function  processAsPDF(const request: EPReportRequestEx; isForDocFlow: Boolean): WideString; stdcall; overload;
    function  processAsXLS(const request: EPReportRequestEx; isForDocFlow: Boolean): WideString; stdcall; overload;
    function  processAsDOC(const request: EPReportRequestEx; isForDocFlow: Boolean): WideString; stdcall; overload;

    function  processAsPDF(const request: EPReportRequestEx): WideString; stdcall; overload;
    function  processAsXLS(const request: EPReportRequestEx): WideString; stdcall; overload;
    function  processAsXLS(const request: EPReportRequestEx; const fileType : WideString): WideString; stdcall; overload;
    function  processAsDOC(const request: EPReportRequestEx; const fileType : WideString): WideString; stdcall; overload;
    function  processAsDBF(const request: EPReportRequestEx): WideString; stdcall; overload;

    function  processForHOE(const request: EPReportRequestEx; const resultType : WideString): WideString; stdcall;

    function getFileDodatokOk(const inputList: AnswerFileDodatokOkList): AnswerFileDodatokOkList; stdcall;

    //Сохранение передаваемого с клиента файла на дисковом пространстве
    //Файловой Системы Сервера Приложений
    procedure saveFile(const aFile: ArrayOfByte; const folderName: WideString;
      const fileName: WideString); stdcall;

    //Извлечение в буфер обмена байтового потока из файла, находящегося
    //на дисковом пространстве Файловой Системы Сервера Приложений
    function readingFile(const fileName: WideString): string; stdcall;

    //Удаление вложенного файла из дискового пространства
    //Файловой Системы Сервера Приложений
    function deleteFile(const folderName: WideString;
      const fileName: WideString): Boolean; stdcall;

    //Извлечение с помощью File Transfer Protocol в буфер обмена байтового
    //потока из находящегося на дисковом пространстве Локальной Сети файла
    function readingByFTP(const un: WideString; const pw: WideString;
      const ip: WideString; const dir: WideString;
      const fileName: WideString): WideString; stdcall; overload;
    function readingByFTP(const un: WideString; const pw: WideString;
      const ip: WideString; const dir: WideString;
      const fileName: WideString; isException: Boolean): WideString; stdcall; overload;


    //Сохранение передаваемого с Клиента файла на дисковом пространстве
    //Локальной Сети с помощью File Transfer Protocol по заданному адресу
    function saveByFTP(const aFile: ArrayOfByte;
      const un: WideString; const pw: WideString;
      const ip: WideString; const dirToCreate: WideString;
      const fileName: WideString): Boolean; stdcall;

    //Удаление вложенного файла из дискового пространства
    //Локальной Сети с помощью File Transport Protocol
    function deleteByFTP(const un: WideString; const pw: WideString;
      const ip: WideString; const dir: WideString;
      const fileName: WideString): Boolean; stdcall;
  end;

implementation



initialization
  InvRegistry.RegisterInterface(TypeInfo(ENReportControllerSoapPort), 'http://ksoe.org/ENReportController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENReportControllerSoapPort), 'http://ksoe.org/ENReportController/action/ENReportController.%operationName%');
  //RemClassRegistry.RegisterXSClass(ENReport, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReport');
  //RemClassRegistry.RegisterXSClass(EPReportRequestEx, 'http://ksoe.org/EnergyproControllerService/type/', 'EPReportRequestEx');

  RemClassRegistry.RegisterXSClass(AnswerFileDodatokOk, 'http://ksoe.org/EnergyproControllerService/type/', 'AnswerFileDodatokOk');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfAnswerFileDodatokOk), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfAnswerFileDodatokOk');
  RemClassRegistry.RegisterXSClass(AnswerFileDodatokOkList, 'http://ksoe.org/EnergyproControllerService/type/', 'AnswerFileDodatokOkList');

  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfByte), 'http://ksoe.org/ENReportController/type/', 'ArrayOfByte');


end.
