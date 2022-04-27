
unit ShowENSubstation04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList, Grids,
  ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  EnergyProController, EnergyProController2,
  ENSubstation04Controller, AdvObj ;


type
  TfrmENSubstation04Show = class(TChildForm)
  HTTPRIOENSubstation04: THTTPRIO;
    ImageList1: TImageList;
    sgENSubstation04: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    actSchemeList: TAction;
    tbSchemeList: TToolButton;
    HTTPRIOCNPack: THTTPRIO;
    actLoadS04Reserv: TAction;
    tlBtnLoadS04Reserv: TToolButton;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENSubstation04TopLeftChanged(Sender: TObject);
procedure sgENSubstation04DblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actSchemeListExecute(Sender: TObject);
    procedure sgENSubstation04MouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure actLoadS04ReservExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENSubstation04Obj: ENSubstation04;
 // ENSubstation04FilterObj: ENSubstation04Filter;
  

var
  frmENSubstation04Show : TfrmENSubstation04Show;
  CodeS04: Integer;
  NameS04, BuhnameS04, InvnumberS04, NominalpowerS04,
  LastrepairdateS04: String;
  chambersQuantityS04,
  SubstationtypeS04, BelongingS04, OwnerS04: Integer;

procedure LoadS04Reserv(pStationCode04: Integer; pHTTPRIOCNPack: THTTPRIO);

implementation

uses Main, EditENSubstation04, EditENSubstation04Filter,
  ENElementController, ShowENScheme, ENSchemeController, Globals, ENConsts,
  CNPackController, DataModuleReportsENetObject, DataModuleReportsEWF;

{$R *.dfm}

var
  //frmENSubstation04Show : TfrmENSubstation04Show;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSubstation04Headers: array [1..9] of String =
        ( 'Код'
          ,'Назва підстанції 10-6/0.4'
          ,'Підрозділ'
          ,'Бухгалтерське найменування підстанції '
          ,'Інвентарний номер'
          ,'Потужність, кВА'
          ,'Дата останнього кап. ремонту'
          ,'Є заміри'
          ,'Камер'
        );
   

procedure TfrmENSubstation04Show.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSubstation04Show:=nil;
    inherited;
  end;

procedure LoadS04Reserv(pStationCode04: Integer; pHTTPRIOCNPack: THTTPRIO);
var TempCNPack: CNPackControllerSoapPort; CNPackList: CNPackShortList;
  cnpFilterObject: CNPackFilter; //Фильтр пакетов ПРИСОЕДИНЕНИЕ I - IV
  vSubSystemID, packID, vQRY_LoadS04ReservPack: Integer;
  reportPath: string; //frxRep: TfrxReport;
  //packArr: CNPackController.ArrayOfInteger;
begin
  //SetLength(packArr, 0);
  vSubSystemID := 0; packID := 0;

  TempCNPack :=  pHTTPRIOCNPack as CNPackControllerSoapPort;
  cnpFilterObject := CNPackFilter.Create();
  SetNullIntProps(cnpFilterObject);
  SetNullXSProps(cnpFilterObject);

  cnpFilterObject.conditionSQL := ' p.id in (select max(enl.id_pack) ' +
    ' from cn.adso_enlines enl where enl.code_substation04 = ' +
        IntToStr(pStationCode04) + #13#10 +
    ' and enl.code_transformer is not Null ' + #13#10 +
    ' and enl.id_pack not in (select id from cn.adso_packages ' +
    '   where id_pack_status = 1000))';

  //packArr := TempCNPack.getScrollableFilteredCodeArray(cnpFilterObject, 0, 1);
  CNPackList := TempCNPack.getCNPackCurStateList(cnpFilterObject, 0, 1);

  //if Length(packArr) > 0 then vSubSystemID := 20;

  //if vSubSystemID > 0 then
  //  ShowMessage('id_pack = ' + IntToStr(packArr[0]) + #13#10 +
  //    'id_subsystem + ' + IntToStr(vSubSystemID));

  if High(CNPackList.list) > -1 then
    begin //Присоединение V с 19.04.2018 г.
      vSubSystemID := Globals.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER;
      packID := CNPackList.list[0].packCode;
      vQRY_LoadS04ReservPack := Globals.QRY_LoadS04ReservPackADSO;
      //ShowMessage('id_pack = ' + IntToStr(packID) + #13#10 +
      //  'id_subsystem = ' + IntToStr(vSubSystemID));
    end;

  if (vSubSystemID <= 0) or (packID <= 0) then
    begin
      cnpFilterObject.conditionSQL := ' p.id in (select max(enl.id_pack) ' +
        ' from cn.eap_enlines enl where enl.code_substation04 = ' +
            IntToStr(pStationCode04) + #13#10 +
        ' and enl.code_transformer is not Null ' + #13#10 +
        ' and enl.id_pack not in (select id from cn.eap_packages ' +
        '   where id_pack_status = 1000))';

      //packArr := TempCNPack.getScrollableFilteredCodeArray(cnpFilterObject, 0, 1);
      CNPackList := TempCNPack.getCNPackCurStateList(cnpFilterObject, 0, 1);

      //if Length(packArr) > 0 then vSubSystemID := 20;

      //if vSubSystemID > 0 then
      //  ShowMessage('id_pack = ' + IntToStr(packArr[0]) + #13#10 +
      //    'id_subsystem + ' + IntToStr(vSubSystemID));

      if High(CNPackList.list) > -1 then
        begin //Присоединение IV с 01.03.2013 г.
          vSubSystemID := Globals.SS_ELECTRICINSTALLACCESSPOWER;
          packID := CNPackList.list[0].packCode;
          vQRY_LoadS04ReservPack := Globals.QRY_LoadS04ReservPack;
          //ShowMessage('id_pack = ' + IntToStr(packID) + #13#10 +
          //  'id_subsystem = ' + IntToStr(vSubSystemID));
        end;
    end;

  if (vSubSystemID <= 0) or (packID <= 0) then
    begin
      cnpFilterObject.conditionSQL := ' p.id in (select max(enl.id_pack) ' +
        ' from cn.cn_20110314_enlines enl where enl.code_substation04 = ' +
            IntToStr(pStationCode04) + #13#10 +
        ' and enl.code_transformer is not Null ' + #13#10 +
        ' and enl.id_pack not in (select id from cn.cn_20110314_packages ' +
        '   where id_pack_status = 1000))';
      CNPackList := TempCNPack.getCNPackCurStateList(cnpFilterObject, 0, 1);
      if High(CNPackList.list) > -1 then
        begin //Присоединение III с 14.03.2011 г.
          vSubSystemID := Globals.SS_CONNECTION_20110314;
          packID := CNPackList.list[0].packCode;
          vQRY_LoadS04ReservPack := Globals.QRY_LoadS04ReservPackCN20110314;
          //ShowMessage('id_pack = ' + IntToStr(packID) + #13#10 +
          //  'id_subsystem = ' + IntToStr(vSubSystemID));
        end;
    end;

  if (vSubSystemID <= 0) or (packID <= 0) then
    begin
      cnpFilterObject.conditionSQL := ' p.id in (select max(enl.id_pack) ' +
        ' from cn.ncn_enlines enl where enl.code_substation04 = ' +
            IntToStr(pStationCode04) + #13#10 +
        ' and enl.code_transformer is not Null ' + #13#10 +
        ' and enl.id_pack not in (select id from cn.ncn_packages ' +
        '   where id_pack_status = 1000))';
      CNPackList := TempCNPack.getCNPackCurStateList(cnpFilterObject, 0, 1);
      if High(CNPackList.list) > -1 then
        begin //Присоединение II с 01.08.2010 г.
          vSubSystemID := Globals.SS_NEWCONNECTION;
          packID := CNPackList.list[0].packCode;
          vQRY_LoadS04ReservPack := Globals.QRY_LoadS04ReservPackNCN;
          //ShowMessage('id_pack = ' + IntToStr(packID) + #13#10 +
          //  'id_subsystem = ' + IntToStr(vSubSystemID));
        end;
    end;

  if (vSubSystemID <= 0) or (packID <= 0) then
    begin
      cnpFilterObject.conditionSQL := ' p.id in (select max(enl.id_pack) ' +
        ' from cn.cn_enlines enl where enl.code_substation04 = ' +
            IntToStr(pStationCode04) + #13#10 +
        ' and enl.code_transformer is not Null ' + #13#10 +
        ' and enl.id_pack not in (select id from cn.cn_packages ' +
        '   where id_pack_status = 1000))';
      CNPackList := TempCNPack.getCNPackCurStateList(cnpFilterObject, 0, 1);
      if High(CNPackList.list) > -1 then
        begin //Присоединение I до 01.08.2010 г.
          vSubSystemID := Globals.SS_CONNECTION;
          packID := CNPackList.list[0].packCode;
          vQRY_LoadS04ReservPack := Globals.QRY_LoadS04ReservPackCN;
          //ShowMessage('id_pack = ' + IntToStr(packID) + #13#10 +
          //  'id_subsystem = ' + IntToStr(vSubSystemID));
        end;
    end;

  if vQRY_LoadS04ReservPack = 0 then
    vQRY_LoadS04ReservPack := Globals.QRY_LoadS04ReservPack;
  if vSubSystemID = 0 then
    vSubSystemID := Globals.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER;

  if (vSubSystemID > 0) and (vQRY_LoadS04ReservPack > 0) then //and (packID > 0)
    begin
      DataModuleReportsENetObject.subsystemID := vSubSystemID;
      //Загрузка модуля невизуальных компонентов объектов энергетики EnergyNet
      if not Assigned(DMReportsENetObject) then
        Application.CreateForm(TDMReportsENetObject, DMReportsENetObject);

      if not DMReportsENetObject.sesEN.Connected then
        DMReportsENetObject.sesEN.Connected := True;

      if (not DMReportsENetObject.sesEWF.Connected)
      and CheckValueInArray(Application.Tag, [
        ENConsts.CONFIG_ENERGYNET_CLIENT_VERSION,
        ENConsts.CONFIG_ENERGYWORKFLOW_CLIENT_VERSION])
      then DMReportsENetObject.sesEWF.Connected := True;

      if DMReportsENetObject.hLoadS04Reserv = 0 then
        begin
          DMReportsENetObject.packageID := packID;

          reportPath := ExtractFilePath(Application.ExeName) + 'Reports';

          //PRIC-306. Формирование из Базы Данных EnergyWorkFlow запросов
          //для расчёта Загрузки Трансформаторной Подстанции 10 - 6 / 0,4 кВ

          //Загрузка модуля невизуальных компонентов внешней отчётности
          if not Assigned(DMReportsEWF) then
            Application.CreateForm(TDMReportsEWF, DMReportsEWF);
          try
            if (not DMReportsEWF.sesReportEWF.Connected)
            and CheckValueInArray(Application.Tag, [
              ENConsts.CONFIG_ENERGYNET_CLIENT_VERSION,
              ENConsts.CONFIG_ENERGYWORKFLOW_CLIENT_VERSION])
            then DMReportsEWF.sesReportEWF.Connected := True;

            DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
              QRY_EWFFiderGauge, //Код запроса cn.ewfreport_query_text
              DMReportsENetObject.zqryEWFFiderGauge, //Компонент класса TZQuery
              nil, //Компонента класса TfrxDBDataset как источник данных
              'zqryEWFFiderGauge.sql', //Файл запроса *.sql
              'LoadS04Reserv', //Директории хранения запроса
              'reportLoadS04Reserv.fr3', //Файл *.fr3 отчёта
              0, //RT_LoadS04fewTransformer //Код в cn.ewfreports *.fr3 отчёта
              False, //Источник запроса cn.ewfreport_query_text
              0); //Потребности в TfrxDBDataSet НЕТ. ВЫБОРКА

            DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
              QRY_EditEWFFiderGauge, //Код запроса cn.ewfreport_query_text
              DMReportsENetObject.zqryEditEWFFiderGauge, //TZQuery
              nil, //Компонента класса TfrxDBDataset как источник данных
              'zqryEditEWFFiderGauge.sql', //Файл запроса *.sql
              'LoadS04Reserv', //Директории хранения запроса
              'reportLoadS04Reserv.fr3', //Файл *.fr3 отчёта
              0, //RT_LoadS04fewTransformer //Код cn.ewfreports *.fr3 отчёта
              False, //Источник запроса cn.ewfreport_query_text
              4); //Потребности в TfrxDBDataSet НЕТ. ФУНКЦИЯ РЕДАКТИРОВАНИЯ

            DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
              QRY_LoadS04ReservENTransformer, //Код cn.ewfreport_query_text
              DMReportsENetObject.zqryLoadS04ReservENTransformer, //TZQuery
              DMReportsENetObject.frxDBDsLoadS04ReservENTransformer,
              'zqryLoadS04ReservENTransformer.sql', //Файл запроса *.sql
              'LoadS04Reserv', //Директория хранения запроса
              'reportLoadS04Reserv.fr3', //Файл *.fr3 отчёта
              0, //RT_LoadS04fewTransformer //Код *.fr3 отчёта
              False, //Источник запроса cn.ewfreport_query_text
              1); //Потребность в TfrxDBDataSet ЕСТЬ. Вид запроса - ВЫБОРКА

            DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
              QRY_LoadS04ReservENTrPowStr, //Код в cn.ewfreport_query_text
              DMReportsENetObject.zqryLoadS04ReservENTrPowStr, //TZQuery
              DMReportsENetObject.frxDBDsLoadS04ReservENTrPowStr, //Источник
              'zqryLoadS04ReservENTrPowStr.sql', //Файл запроса *.sql
              'LoadS04Reserv', //Директория хранения запроса
              'reportLoadS04Reserv.fr3', //Файл *.fr3 отчёта
              0, //RT_LoadS04fewTransformer //Код в cn.ewfreports *.fr3 отчёта
              False, //Источник запроса cn.ewfreport_query_text
              1); //Потребность в TfrxDBDataSet ЕСТЬ. Вид запроса - ВЫБОРКА

            DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
              vQRY_LoadS04ReservPack, //Код в таблице cn.ewfreport_query_text
              DMReportsENetObject.zqryLoadS04ReservPack, //Компонент TZQuery
              DMReportsENetObject.frxDBDsLoadS04ReservPack, //TfrxDBDataset
              'zqryLoadS04ReservPack.sql', //Файл запроса *.sql
              'LoadS04Reserv', //Директория хранения запроса
              'reportLoadS04Reserv.fr3', //Файл *.fr3 отчёта
              0, //RT_LoadS04fewTransformer //Код в cn.ewfreports *.fr3 отчёта
              False, //Источник запроса cn.ewfreport_query_text
              1); //Потребность в TfrxDBDataSet ЕСТЬ. Вид запроса - ВЫБОРКА

            DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
              QRY_LoadS04ReservTrPacks, //Код запроса в cn.ewfreport_query_text
              DMReportsENetObject.zqryLoadS04ReservTrPacks, //Компонент TZQuery
              DMReportsENetObject.frxDBDsLoadS04ReservTrPacks, //TfrxDBDataset
              'zqryLoadS04ReservTrPacks.sql', //Файл запроса *.sql
              'LoadS04Reserv', //Директория хранения запроса
              'reportLoadS04Reserv.fr3', //Файл *.fr3 отчёта
              0, //RT_LoadS04fewTransformer //Код в cn.ewfreports *.fr3 отчёта
              False, //Источник запроса cn.ewfreport_query_text
              1); //Потребность в TfrxDBDataSet ЕСТЬ. Вид запроса - ВЫБОРКА

            DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
              QRY_LoadS04ReservTrPacksAgreg, //Код в cn.ewfreport_query_text
              DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg, //TZQuery
              DMReportsENetObject.frxDBDsLoadS04ReservTrPacksAgreg,
              'zqryLoadS04ReservTrPacksAgreg.sql', //Файл запроса *.sql
              'LoadS04Reserv', //Директория хранения запроса
              'reportLoadS04Reserv.fr3', //Файл *.fr3 отчёта
              0, //RT_LoadS04fewTransformer //Код в cn.ewfreports *.fr3 отчёта
              False, //Источник запроса cn.ewfreport_query_text
              1); //Потребность в TfrxDBDataSet ЕСТЬ. Вид запроса - ВЫБОРКА

            DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
              QRY_LoadS04ReservTrPacksRealiz, //Код в cn.ewfreport_query_text
              DMReportsENetObject.zqryLoadS04ReservTrPacksRealiz, //TZQuery
              DMReportsENetObject.frxDBDsLoadS04ReservTrPacksRealiz,
              'zqryLoadS04ReservTrPacksRealiz.sql', //Файла запроса *.sql
              'LoadS04Reserv', //Директория хранения запроса
              'reportLoadS04Reserv.fr3', //Файл *.fr3 отчёта
              0, //RT_LoadS04fewTransformer //Код в cn.ewfreports *.fr3 отчёта
              False, //Источник запроса cn.ewfreport_query_text
              1); //Потребность в TfrxDBDataSet ЕСТЬ. Вид запроса - ВЫБОРКА

            //Заполнение в строковую переменную названия отчёта из Базы Данных
            DMReportsEWF.zqryEWFReportFromDBbyID.Close;
            DMReportsEWF.zqryEWFReportFromDBbyID.ParamByName(
              'id_report').AsInteger := RT_LoadS04fewTransformer;
            DMReportsEWF.zqryEWFReportFromDBbyID.Open;
            if DMReportsEWF.zqryEWFReportFromDBbyID.RecordCount = 1 then
              reportPath := reportPath + '\' +
                DMReportsEWF.zqryEWFReportFromDBbyID.FieldByName('rtfile').AsString
            else
              reportPath := reportPath + '\reportLoadS04Reserv.fr3';
          finally //Выгрузка из оперативной памяти модуля невизуальных
            DMReportsEWF.Free;    //компонентов внешней отчётности
            DMReportsEWF := nil;  //проекта EnergyWorkFlow
          end;

          DMReportsENetObject.frxDBDsLoadS04ReservPack.DataSet :=
            DMReportsENetObject.zqryLoadS04ReservPack;
          DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.DataSource.DataSet :=
            DMReportsENetObject.zqryLoadS04ReservPack;
          DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
            'id_subsystem').AsInteger := DataModuleReportsENetObject.subsystemID;
          DMReportsENetObject.zqryLoadS04ReservENTransformer.DataSource.DataSet :=
            DMReportsENetObject.zqryLoadS04ReservPack;
          DMReportsENetObject.zqryLoadS04ReservENTrPowStr.DataSource.DataSet :=
            DMReportsENetObject.zqryLoadS04ReservPack;
          DMReportsENetObject.movementID := 0;
          DMReportsENetObject.stateID := 0;
          DMReportsENetObject.zqryLoadS04ReservTrPacks.ParamByName(
            'id_subsystem').AsInteger := DataModuleReportsENetObject.subsystemID;

          DMReportsENetObject.zqryLoadS04ReservPack.Close;
          //DMReportsENetObject.zqryLoadS04ReservPack.ParamByName( //SUPP-17417
          //  'id_subsystem').AsInteger := DataModuleReportsENetObject.subsystemID;
          if DMReportsENetObject.packageID = 0 then
            begin
              DMReportsENetObject.zqryLoadS04ReservPack.ParamByName(
                'id_pack').Clear;
              DMReportsENetObject.zqryLoadS04ReservTrPacks.ParamByName(
                'id_pack').Clear;
            end
          else
            begin
              DMReportsENetObject.zqryLoadS04ReservPack.ParamByName(
                'id_pack').AsInteger := DMReportsENetObject.packageID;
              DMReportsENetObject.zqryLoadS04ReservTrPacks.ParamByName(
                'id_pack').AsInteger := DMReportsENetObject.packageID;
            end;

          DMReportsENetObject.zqryLoadS04ReservPack.ParamByName(
            'id_point').Clear;
          DMReportsENetObject.codeS04 := pStationCode04;
          DMReportsENetObject.codeTr := 0;

          DMReportsENetObject.zqryLoadS04ReservPack.ParamByName(
            'code_substation04').AsInteger := DMReportsENetObject.codeS04;

          //Вызов процедуры передачи через параметры показателей загрузки
          //Понижающих Трансформаторных Станций 10 - 6 / 0,4 кВ
          //из промежуточной таблиц комплекса WorkFlow в случае отсутствия
          //достоверных данных, совпадающих с протоколами режимных замеров,
          //в таблице комплекса EnergyNet с возможностью изменения этих
          //параметров и сохранением их в промежуточную таблицу WorkFlow
          //DMReportsENetObject.St04TransformerQuerySetParam(
          //  isExistENFiderGauge);

          DMReportsENetObject.frxRLoadS04Reserv.LoadFromFile(reportPath);

          //Увеличение количества открытых отчётов из модуля невизуальных компонентов,
          Inc(LoadReportENetObjectCount); //взаимодействующих с EnergyNet на единицу

          DMReportsENetObject.frxRLoadS04Reserv.ShowReport();
          if LoadReportENetObjectCount > 0  then //Проверка для закрытия отчёта
            begin
              DMReportsENetObject.hLoadS04Reserv :=
                DMReportsENetObject.frxRLoadS04Reserv.PreviewForm.Handle;
              DMReportsENetObject.frxRLoadS04Reserv.PreviewForm.Caption :=
                DMReportsENetObject.frxRLoadS04Reserv.PreviewForm.Caption +
                ' Расчёт загрузки Трансформаторной Подстанции' +
                ' 10 - 6 / 0,4 кВ c учётом выданных и предложенных' +
                ' Технических Условий. (Подсистемы ПРИСОЕДИНЕНИЕ I - IV ' +
                ' до и после 01.08.2010, с 14.03.2011, с 01.03.2013 гг.)';
            end;
        end //if DMReportsENetObject.hLoadS04Reserv = 0 then
      else DMReportsENetObject.frxRLoadS04Reserv.PreviewForm.Show;
    end;
end;

procedure TfrmENSubstation04Show.FormShow(Sender: TObject);
var
  TempENSubstation04: ENSubstation04ControllerSoapPort;
  i: Integer;
  ENSubstation04List: ENSubstation04ShortList;
begin
  //DisableActions ([actInsert, actEdit, actDelete],
  //  (HTTPRIOENSubstation04.HTTPWebNode.UserName <> 'energynet')
  //  and (HTTPRIOENSubstation04.HTTPWebNode.UserName <> 'promadmin'));

  FormatSettings.DecimalSeparator := '.';
  SetGridHeaders(ENSubstation04Headers, sgENSubstation04.ColumnHeaders);
  ColCount:=100;
  TempENSubstation04 :=  HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSubstation04Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubstation04List := TempENSubstation04.getScrollableFilteredList(ENSubstation04Filter(FilterObject),0,ColCount);


  LastCount:=High(ENSubstation04List.list);

  if LastCount > -1 then
     sgENSubstation04.RowCount:=LastCount+2
  else
     sgENSubstation04.RowCount:=2;

   with sgENSubstation04 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubstation04List.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubstation04List.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubstation04List.list[i].name;
        Cells[2,i+1] := ENSubstation04List.list[i].renRefName;
        Cells[3,i+1] := ENSubstation04List.list[i].buhName;
        Cells[4,i+1] := ENSubstation04List.list[i].invNumber;

        if ENSubstation04List.list[i].nominalPower = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENSubstation04List.list[i].nominalPower.DecimalString;
        if ENSubstation04List.list[i].lastRepairDate = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(ENSubstation04List.list[i].lastRepairDate);

        AddCheckBox(7, i + 1,
          (ENSubstation04List.list[i].fiderGaugeFullness = 1), False);

        if ENSubstation04List.list[i].chambersQuantity <> low(Integer) then
          Cells[8, i + 1] :=
            IntToStr(ENSubstation04List.list[i].chambersQuantity)
        else
          Cells[8, i + 1] := '';

        LastRow := i + 1;
        sgENSubstation04.RowCount := LastRow + 1;
      end;
      
   ColCount:=ColCount+1;
   sgENSubstation04.Row:=1;
end;

procedure TfrmENSubstation04Show.sgENSubstation04TopLeftChanged(Sender: TObject);
var TempENSubstation04: ENSubstation04ControllerSoapPort;
  i,CurrentRow: Integer;
  ENSubstation04List: ENSubstation04ShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENSubstation04.TopRow + sgENSubstation04.VisibleRowCount) = ColCount
  then
    begin
      TempENSubstation04 :=  HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
      CurrentRow:=sgENSubstation04.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSubstation04Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubstation04List := TempENSubstation04.getScrollableFilteredList(ENSubstation04Filter(FilterObject),ColCount-1, 100);

  sgENSubstation04.RowCount:=sgENSubstation04.RowCount+100;
  LastCount:=High(ENSubstation04List.list);
  
  with sgENSubstation04 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubstation04List.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSubstation04List.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSubstation04List.list[i].name;
        Cells[2,i+CurrentRow] := ENSubstation04List.list[i].renRefName;
        Cells[3,i+CurrentRow] := ENSubstation04List.list[i].buhName;
        Cells[4,i+CurrentRow] := ENSubstation04List.list[i].invNumber;
        if ENSubstation04List.list[i].nominalPower = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := ENSubstation04List.list[i].nominalPower.DecimalString;
        if ENSubstation04List.list[i].lastRepairDate = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDate2String(ENSubstation04List.list[i].lastRepairDate);
        AddCheckBox(7, i + CurrentRow,
          (ENSubstation04List.list[i].fiderGaugeFullness = 1), False);
        Cells[8, i + CurrentRow] :=
          IntToStr(ENSubstation04List.list[i].chambersQuantity);
        LastRow:=i+CurrentRow;
      end;

   ColCount:=ColCount+100;
   sgENSubstation04.Row:=CurrentRow-5;
   sgENSubstation04.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSubstation04Show.sgENSubstation04DblClick(Sender: TObject);
Var TempENSubstation04: ENSubstation04ControllerSoapPort;
  ENSubstation04Obj: ENSubstation04;
begin
  if (FormMode = fmNormal) or (FormMode = fmFiltered) then
  begin
    try
      CodeS04 := StrToInt(GetReturnValue(sgENSubstation04,0)); //Код
      NameS04 := sgENSubstation04.Cells[1, sgENSubstation04.Row]; //Назва підстанції 10-6/0.4
      BuhnameS04 := sgENSubstation04.Cells[3, sgENSubstation04.Row]; //Бухгалтерське найменування підстанції
      InvnumberS04 := sgENSubstation04.Cells[4, sgENSubstation04.Row]; //Інвентарний номер
      NominalpowerS04 := sgENSubstation04.Cells[5, sgENSubstation04.Row]; //Потужність, кВА
      LastrepairdateS04 := sgENSubstation04.Cells[6, sgENSubstation04.Row]; //Дата останнього кап. ремонту
      chambersQuantityS04 := //Кількість камер трансформаторів
        StrToInt(GetReturnValue(sgENSubstation04, 8));
      //
      TempENSubstation04 := HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
      ENSubstation04Obj := TempENSubstation04.getObject(StrToInt(sgENSubstation04.Cells[0, sgENSubstation04.Row]));
      SubstationtypeS04 := ENSubstation04Obj.substationType.code;
      BelongingS04 := ENSubstation04Obj.belongingRef.code;
      OwnerS04 := ENSubstation04Obj.ownerRef.code;

    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSubstation04Show.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSubstation04.RowCount-1 do
   for j:=0 to sgENSubstation04.ColCount-1 do
     sgENSubstation04.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSubstation04Show.actViewExecute(Sender: TObject);
Var TempENSubstation04: ENSubstation04ControllerSoapPort;
begin
 TempENSubstation04 := HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
   try
     ENSubstation04Obj := TempENSubstation04.getObject(StrToInt(sgENSubstation04.Cells[0,sgENSubstation04.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubstation04Edit:=TfrmENSubstation04Edit.Create(Application, dsView);
  try
    frmENSubstation04Edit.ShowModal;
  finally
    frmENSubstation04Edit.Free;
    frmENSubstation04Edit:=nil;
  end;
end;

procedure TfrmENSubstation04Show.actEditExecute(Sender: TObject);
Var TempENSubstation04: ENSubstation04ControllerSoapPort;
begin
 TempENSubstation04 := HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
   try
     ENSubstation04Obj := TempENSubstation04.getObject(StrToInt(sgENSubstation04.Cells[0,sgENSubstation04.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubstation04Edit:=TfrmENSubstation04Edit.Create(Application, dsEdit);
  try
    if frmENSubstation04Edit.ShowModal= mrOk then
      begin
        //TempENSubstation04.save(ENSubstation04Obj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSubstation04Edit.Free;
    frmENSubstation04Edit:=nil;
  end;
end;

procedure TfrmENSubstation04Show.actDeleteExecute(Sender: TObject);
Var TempENSubstation04: ENSubstation04ControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSubstation04 := HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSubstation04.Cells[0,sgENSubstation04.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Понижаюча трансформаторна підстанція 6-10/0.4 кВ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSubstation04.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSubstation04Show.actInsertExecute(Sender: TObject);
Var TempENSubstation04: ENSubstation04ControllerSoapPort;
begin
  TempENSubstation04 := HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
  ENSubstation04Obj:=ENSubstation04.Create;
  ENSubstation04Obj.element := ENElement.Create();
   ENSubstation04Obj.nominalPower:= TXSDecimal.Create;
  try
    frmENSubstation04Edit:=TfrmENSubstation04Edit.Create(Application, dsInsert);
    try
      if frmENSubstation04Edit.ShowModal = mrOk then
      begin
        if ENSubstation04Obj<>nil then
            //TempENSubstation04.add(ENSubstation04Obj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSubstation04Edit.Free;
      frmENSubstation04Edit:=nil;
    end;
  finally
    ENSubstation04Obj.Free;
  end;
end;

procedure TfrmENSubstation04Show.actLoadS04ReservExecute(Sender: TObject);
var strStationCode: String; vSgENSubstationRow: Integer;
begin
  vSgENSubstationRow := sgENSubstation04.Row;
  if vSgENSubstationRow >= 1 then
    begin
      strStationCode := sgENSubstation04.Cells[0, vSgENSubstationRow];
      if strStationCode <> '' then ShowENSubstation04.LoadS04Reserv(
        StrToInt(strStationCode), HTTPRIOCNPack);
    end;
end;

procedure TfrmENSubstation04Show.actUpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender);
end;


procedure TfrmENSubstation04Show.actFilterExecute(Sender: TObject);
begin
  frmENSubstation04FilterEdit:=TfrmENSubstation04FilterEdit.Create(Application, dsInsert);
  try
    ENSubstation04FilterObj := ENSubstation04Filter.Create;
    SetNullIntProps(ENSubstation04FilterObj);
    SetNullXSProps(ENSubstation04FilterObj);

    if frmENSubstation04FilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSubstation04Filter.Create;
      FilterObject := ENSubstation04FilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSubstation04FilterEdit.Free;
    frmENSubstation04FilterEdit := nil;
  end;
end;

procedure TfrmENSubstation04Show.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENSubstation04Show.actSchemeListExecute(Sender: TObject);
Var TempENSubstation04: ENSubstation04ControllerSoapPort;
  ENSubstation04Obj: ENSubstation04;
  ENSchemeFilterObj: ENSchemeFilter;
  fENSchemeShow: TfrmENSchemeShow;
begin
  TempENSubstation04 := HTTPRIOENSubstation04 as
    ENSubstation04ControllerSoapPort;
  try
    ENSubstation04Obj := TempENSubstation04.getObject(StrToInt(
      sgENSubstation04.Cells[0,sgENSubstation04.Row]));
  except
    on EConvertError do Exit;
  end;

  ENSchemeFilterObj := ENSchemeFilter.Create;
  SetNullIntProps(ENSchemeFilterObj);
  SetNullXSProps(ENSchemeFilterObj);
  ENSchemeFilterObj.elementRef := ENElementRef.Create;
  ENSchemeFilterObj.elementRef.code := ENSubstation04Obj.element.code;

  fENSchemeShow :=
    TfrmENSchemeShow.Create(Application, fmNormal, ENSchemeFilterObj);
  try
    fENSchemeShow.ShowModal;
  finally
    fENSchemeShow.Free;
  end;
end;

procedure TfrmENSubstation04Show.sgENSubstation04MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crArrow;
end;

end.
