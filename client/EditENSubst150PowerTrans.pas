unit EditENSubst150PowerTrans;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150PowerTransController,
    AdvObj;

type
    TfrmENSubst150PowerTransEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblFactoryNumber : TLabel;
    edtFactoryNumber: TEdit;
    lblVoltageVN : TLabel;
    edtVoltageVN: TEdit;
    lblVoltageSN : TLabel;
    edtVoltageSN: TEdit;
    lblVoltageNN : TLabel;
    edtVoltageNN: TEdit;
    lblCurrentVN : TLabel;
    edtCurrentVN: TEdit;
    lblCurrentSN : TLabel;
    edtCurrentSN: TEdit;
    lblCurrentNN : TLabel;
    edtCurrentNN: TEdit;
    lblPowerVN : TLabel;
    edtPowerVN: TEdit;
    lblPowerSN : TLabel;
    edtPowerSN: TEdit;
    lblPowerNN : TLabel;
    edtPowerNN: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblENSubst150PowerTransType: TLabel;
    edtENSubst150PowerTransType: TEdit;
    spbENSubst150PowerTransType: TSpeedButton;

    HTTPRIOENSubst150PowerTrans: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblENVoltageClass: TLabel;
    edtENVoltageClass: TEdit;
    spbENVoltageClass: TSpeedButton;
    HTTPRIOENVoltageClass: THTTPRIO;
    lblMaterialsName: TLabel;
    spbTkMaterials: TSpeedButton;
    edtMaterialsName: TEdit;
    HTTPRIOTKMaterials: THTTPRIO;
    spbENSubstation150: TSpeedButton;
    edtENSubstation150Name: TEdit;
    lblENSubstation150Name: TLabel;
    HTTPRIOENSubstation150: THTTPRIO;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    HTTPRIOENSubst2PowTrans: THTTPRIO;
    grpENSubstation150: TGroupBox;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actViewStation: TAction;
    actInsertStation: TAction;
    actDeleteStation: TAction;
    actEditStation: TAction;
    actUpdateStation: TAction;
    actFilterStation: TAction;
    actNoFilterStation: TAction;
    actSchemeListStation: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton11: TToolButton;
    tbSchemeList: TToolButton;
    sgENSubstation150: TAdvStringGrid;
    actSubst2PowTransLink: TAction;
    actSubst2PowTransUnLink: TAction;
    tlBtnSubst2PowTransLink: TToolButton;
    tlBtnSubst2PowTransUnLink: TToolButton;
    grpSubst150PowerTrans: TGroupBox;
    actViewSubst150PowerTrans: TAction;
    actInsertSubst150PowerTrans: TAction;
    actDeleteSubst150PowerTrans: TAction;
    actEditSubst150PowerTrans: TAction;
    actUpdateSubst150PowerTrans: TAction;
    actFilterSubst150PowerTrans: TAction;
    actNoFilterSubst150PowerTrans: TAction;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    sgENSubst150PowerTrans: TAdvStringGrid;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
    procedure spbENSubst150PowerTransTypeClick(Sender : TObject);
    procedure spbENVoltageClassClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
    procedure spbENSubstation150Click(Sender: TObject);
    procedure actUpdateSubst150PowerTransExecute(Sender: TObject);
    procedure actUpdateStationExecute(Sender: TObject);
    procedure sgENSubstation150RowChanging(Sender: TObject; OldRow,
    NewRow: Integer; var Allow: Boolean);
    procedure actSchemeListStationExecute(Sender: TObject);
    procedure actSubst2PowTransLinkExecute(Sender: TObject);
    procedure actSubst2PowTransUnLinkExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSubst150PowerTransEdit: TfrmENSubst150PowerTransEdit;
  ENSubst150PowerTransObj: ENSubst150PowerTrans;

implementation

uses
  ShowENElement, ENElementController,
  ENVoltageClassController, ShowENVoltageClass,
  ENConsts, ShowTKMaterials, TKMaterialsController, ENSubstation150Controller,
  ShowENScheme, ENSchemeController, ENSubst2PowTransController
  , ShowENSubstation150
  , ShowENHighVoltHardwareType
  , ENHighVoltHardwareTypeController
  , ENElementTypeController
;


{$R *.dfm}


var vENSubst150PowerTransObjCode, vStationRefCode, vStationLinkCode: Integer;
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSubstation150Headers: array [1..8] of String =
    ('Код'
    ,'Станція 150 / 35 - 27 / 10 - 6 кВ'
    ,'Інвентарний номер споруди підстанції'
    ,'Проектна потужність, мВА'
    ,'Форма оперативного обслуговування'
    ,'Форма ремонтного обслуговування'
    ,'Бухгалтерське найменування підстанції '
    ,'Кількість трансформаторів'
    );
  ENSubst150PowerTransHeaders: array [1..14] of String =
    ('Код'
    ,'Диспетчерское наименование'
    ,'Заводской номер'
    ,'Напряжение ВН, кВ'
    ,'Напряжение СН, кВ'
    ,'Напряжение НН, кВ'
    ,'Ток ВН, А'
    ,'Ток СН, А'
    ,'Ток НН, А'
    ,'Мощность ВН, кВА'
    ,'Мощность СН, кВА'
    ,'Мощность НН, кВА'
    ,'Примечание'
    ,'Пользователь, внесший изменения'
    );


procedure TfrmENSubst150PowerTransEdit.FormShow(Sender: TObject);
var
  TempENVoltageClass: ENVoltageClassControllerSoapPort;
  TempTKMaterials : TKMaterialsControllerSoapPort;
  ENSubstation150Obj: ENSubstation150;
  voltageClassObj: ENVoltageClass;
  material : TKMaterials;
  TempENSubstation150: ENSubstation150ControllerSoapPort;
  TempENSubst150PowerTrans: ENSubst150PowerTransControllerSoapPort;
  subst150PowerTransShort: ENSubst150PowerTransShort;
begin
  DisableControls([edtCode, edtENSubst150PowerTransType, edtENVoltageClass,
    edtMaterialsName, edtENSubstation150Name, spbENSubstation150, edtEPRenName,
    spbEPRen]);
  SetFloatStyle([edtVoltageVN, edtVoltageSN, edtVoltageNN,
                 edtCurrentVN, edtCurrentSN, edtCurrentNN,
                 edtPowerVN, edtPowerSN, edtPowerNN]);

  vENSubst150PowerTransObjCode := 0; //Инициализация
  vStationRefCode := 0;
  vStationLinkCode := 0;

  if DialogState = dsView then
    begin
      DisableControls([
        spbENSubst150PowerTransType, spbENVoltageClass, spbTkMaterials]);
      DisableActions([actSubst2PowTransLink, actSubst2PowTransUnLink]);
        //actSchemeListLinkStation
    end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin

    DenyBlankValues([
      edtName, edtENSubst150PowerTransType, edtENVoltageClass
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    TempENSubstation150 := HTTPRIOENSubstation150 as ENSubstation150ControllerSoapPort;
    TempENSubst150PowerTrans := HTTPRIOENSubst150PowerTrans as ENSubst150PowerTransControllerSoapPort;
    subst150PowerTransShort := TempENSubst150PowerTrans.getShortObject(ENSubst150PowerTransObj.code);

    vENSubst150PowerTransObjCode := ENSubst150PowerTransObj.code;
    edtCode.Text := IntToStr(vENSubst150PowerTransObjCode);
    edtName.Text := ENSubst150PowerTransObj.name;

    if ENSubst150PowerTransObj.substationRef <> nil then
      if ENSubst150PowerTransObj.substationRef.code <> Low(Integer) then
        begin
          vStationRefCode := ENSubst150PowerTransObj.substationRef.code;
          ENSubstation150Obj := TempENSubstation150.getObject(vStationRefCode);
          try
            edtENSubstation150Name.Text := ENSubstation150Obj.name;
            if ENSubstation150Obj.element <> nil then
              if ENSubstation150Obj.element.renRef <> nil then
                edtEPRenName.Text := ENSubstation150Obj.element.renRef.name;
          finally
            ENSubstation150Obj.Free;
            ENSubstation150Obj := nil;
          end;
        end;

    edtFactoryNumber.Text := ENSubst150PowerTransObj.factoryNumber;
    if ( ENSubst150PowerTransObj.voltageVN <> nil ) then
       edtVoltageVN.Text := ENSubst150PowerTransObj.voltageVN.decimalString
    else
       edtVoltageVN.Text := ''; 
    if ( ENSubst150PowerTransObj.voltageSN <> nil ) then
       edtVoltageSN.Text := ENSubst150PowerTransObj.voltageSN.decimalString
    else
       edtVoltageSN.Text := ''; 
    if ( ENSubst150PowerTransObj.voltageNN <> nil ) then
       edtVoltageNN.Text := ENSubst150PowerTransObj.voltageNN.decimalString
    else
       edtVoltageNN.Text := ''; 
    if ( ENSubst150PowerTransObj.currentVN <> nil ) then
       edtCurrentVN.Text := ENSubst150PowerTransObj.currentVN.decimalString
    else
       edtCurrentVN.Text := ''; 
    if ( ENSubst150PowerTransObj.currentSN <> nil ) then
       edtCurrentSN.Text := ENSubst150PowerTransObj.currentSN.decimalString
    else
       edtCurrentSN.Text := ''; 
    if ( ENSubst150PowerTransObj.currentNN <> nil ) then
       edtCurrentNN.Text := ENSubst150PowerTransObj.currentNN.decimalString
    else
       edtCurrentNN.Text := ''; 
    if ( ENSubst150PowerTransObj.powerVN <> nil ) then
       edtPowerVN.Text := ENSubst150PowerTransObj.powerVN.decimalString
    else
       edtPowerVN.Text := ''; 
    if ( ENSubst150PowerTransObj.powerSN <> nil ) then
       edtPowerSN.Text := ENSubst150PowerTransObj.powerSN.decimalString
    else
       edtPowerSN.Text := ''; 
    if ( ENSubst150PowerTransObj.powerNN <> nil ) then
       edtPowerNN.Text := ENSubst150PowerTransObj.powerNN.decimalString
    else
       edtPowerNN.Text := '';

    MakeMultiline(edtCommentGen.Lines, ENSubst150PowerTransObj.commentGen);
    edtENSubst150PowerTransType.Text := subst150PowerTransShort.typeRefName;

    if ENSubst150PowerTransObj.voltageClassRef <> nil then
      if ENSubst150PowerTransObj.voltageClassRef.code <> LOW_INT then
      begin
        TempENVoltageClass := HTTPRIOENVoltageClass as ENVoltageClassControllerSoapPort;
        voltageClassObj := TempENVoltageClass.getObject(ENSubst150PowerTransObj.voltageClassRef.code);
        if voltageClassObj <> nil then
        begin
          edtENVoltageClass.Text := voltageClassObj.description;
        end;
      end;

    if ENSubst150PowerTransObj.materialRef <> nil then
      if ENSubst150PowerTransObj.materialRef.code <> LOW_INT then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        material := TempTKMaterials.getObject(ENSubst150PowerTransObj.materialRef.code);
        if material <> nil then
        begin
          edtMaterialsName.Text := material.name;
        end;
      end;
    actUpdateStation.Execute;
    vStationLinkCode := StrToInt( //Задание кода связанной Станции
      sgENSubstation150.Cells[0, sgENSubstation150.Row]);
    actUpdateSubst150PowerTrans.Execute;
  end;
end;


procedure TfrmENSubst150PowerTransEdit.actSchemeListStationExecute(Sender: TObject);
Var
  TempENSubstation150: ENSubstation150ControllerSoapPort;
  vENSubstation150Obj: ENSubstation150;
  ENSchemeFilterObj: ENSchemeFilter;
  fENSchemeShow: TfrmENSchemeShow;
begin
  TempENSubstation150 := HTTPRIOENSubstation150 as
    ENSubstation150ControllerSoapPort;
  try
    vENSubstation150Obj := TempENSubstation150.getObject(StrToInt(
      sgENSubstation150.Cells[0, sgENSubstation150.Row]));
  except
    on EConvertError do Exit;
  end;

  ENSchemeFilterObj := ENSchemeFilter.Create;
  SetNullIntProps(ENSchemeFilterObj);
  SetNullXSProps(ENSchemeFilterObj);
  ENSchemeFilterObj.elementRef := ENElementRef.Create;
  ENSchemeFilterObj.elementRef.code := vENSubstation150Obj.element.code;

  fENSchemeShow :=
    TfrmENSchemeShow.Create(Application, fmNormal, ENSchemeFilterObj);
  try
    fENSchemeShow.ShowModal;
  finally
    fENSchemeShow.Free;
  end;
end;

procedure TfrmENSubst150PowerTransEdit.actSubst2PowTransLinkExecute(
  Sender: TObject);
var ENSubstation150FilterObj: ENSubstation150Filter;
  condition: String;
  TempENSubst2PowTrans: ENSubst2PowTransControllerSoapPort;
  ENSubst2PowTransObj: ENSubst2PowTrans;
  fENSubstation150Show: TfrmENSubstation150Show;
begin
  if (ENSubst150PowerTransObj = nil)
  and ((vENSubst150PowerTransObjCode <= 0) or (vStationRefCode <= 0)) then
    Exit;

  if vENSubst150PowerTransObjCode <= 0 then
    if ENSubst150PowerTransObj.code <> Low(Integer) then
      vENSubst150PowerTransObjCode := ENSubst150PowerTransObj.code;

  if vStationRefCode <= 0 then
    if ENSubst150PowerTransObj.substationRef <> nil then
      if ENSubst150PowerTransObj.substationRef.code <> Low(Integer) then
        vStationRefCode := ENSubst150PowerTransObj.substationRef.code;

  if (vENSubst150PowerTransObjCode <= 0) or (vStationRefCode <= 0) then
    Exit;

  ENSubstation150FilterObj := ENSubstation150Filter.Create;
  SetNullIntProps(ENSubstation150FilterObj);
  SetNullXSProps(ENSubstation150FilterObj);

  if vStationRefCode > 0 then
    begin
      condition := ENSubstation150FilterObj.conditionSQL;
      AddCondition(condition, '(ensubstation150.code <> ' +
        IntToStr(vStationRefCode) + 'and ensubstation150.code not in (' +
        'select ensubst2powtrans.substationrefcode from ensubst2powtrans ' +
        '  where ensubst2powtrans.powertransrefcode = ' +
           IntToStr(vENSubst150PowerTransObjCode) + '))');
      ENSubstation150FilterObj.conditionSQL := condition;
    end;

  fENSubstation150Show := TfrmENSubstation150Show.Create(
    Application, fmNormal, ENSubstation150FilterObj);
  try
    fENSubstation150Show.btnOk.Visible := True;
    fENSubstation150Show.chkIsVirtStation.Visible := True;
    if fENSubstation150Show.ShowModal = mrOk then
      begin
        ENSubst2PowTransObj := ENSubst2PowTrans.Create;
        ENSubst2PowTransObj.name := ENSubstation150FilterObj.name + ' на ' +
          ShowENSubstation150.NameS150;
        ENSubst2PowTransObj.powerTransRef := ENSubst150PowerTransRef.Create;
        ENSubst2PowTransObj.powerTransRef.code := vENSubst150PowerTransObjCode;
        ENSubst2PowTransObj.substationRef := ENSubstation150Ref.Create;
        ENSubst2PowTransObj.substationRef.code := ShowENSubstation150.CodeS150;
        if ShowENSubstation150.isVirtStation then
          ENSubst2PowTransObj.isVirt := 1
        else
          ENSubst2PowTransObj.isVirt := 0;
        TempENSubst2PowTrans :=
          HTTPRIOENSubst2PowTrans as ENSubst2PowTransControllerSoapPort;
        TempENSubst2PowTrans.add(ENSubst2PowTransObj);
        actUpdateStation.Execute;
        actUpdateSubst150PowerTrans.Execute;
      end;
  finally
    fENSubstation150Show.Free;
    fENSubstation150Show := nil;
  end;
end;

procedure TfrmENSubst150PowerTransEdit.actSubst2PowTransUnLinkExecute(
  Sender: TObject);
var TempENSubst2PowTrans: ENSubst2PowTransControllerSoapPort;
  ENSubst2PowTransFilterObj: ENSubst2PowTransFilter;
  //condition: String; //Исключено объявление не используемых переменных
  vENSubst2PowTransCodes: ENSubst2PowTransController.ArrayOfInteger;
  i: Integer;
begin

  if (ENSubst150PowerTransObj = nil)
  and ((vENSubst150PowerTransObjCode <= 0) or (vStationLinkCode <= 0)) then
    Exit;

  if vENSubst150PowerTransObjCode <= 0 then
    if ENSubst150PowerTransObj.code <> Low(Integer) then
      vENSubst150PowerTransObjCode := ENSubst150PowerTransObj.code;

  if vStationLinkCode <= 0 then
    vStationLinkCode := StrToInt( //Задание кода связанной Станции
      sgENSubstation150.Cells[0, sgENSubstation150.Row]);

  if (vENSubst150PowerTransObjCode <= 0) or (vStationLinkCode <= 0) then
    Exit;

  ENSubst2PowTransFilterObj := ENSubst2PowTransFilter.Create;

  try
    SetNullIntProps(ENSubst2PowTransFilterObj);
    SetNullXSProps(ENSubst2PowTransFilterObj);

    ENSubst2PowTransFilterObj.powerTransRef := ENSubst150PowerTransRef.Create;
    ENSubst2PowTransFilterObj.powerTransRef.code :=
      vENSubst150PowerTransObjCode;
    ENSubst2PowTransFilterObj.substationRef := ENSubstation150Ref.Create;
    ENSubst2PowTransFilterObj.substationRef.code := vStationLinkCode;

    TempENSubst2PowTrans :=
      HTTPRIOENSubst2PowTrans as ENSubst2PowTransControllerSoapPort;

    vENSubst2PowTransCodes :=
      TempENSubst2PowTrans.getScrollableFilteredCodeArray(
        ENSubst2PowTransFilterObj, 0, -1);

    if Length(vENSubst2PowTransCodes) > 0 then
      begin
        for i := Low(vENSubst2PowTransCodes) to High(vENSubst2PowTransCodes) do
          TempENSubst2PowTrans.remove(vENSubst2PowTransCodes[i]);
        actUpdateStation.Execute;
        actUpdateSubst150PowerTrans.Execute;
      end;
  finally
    ENSubst2PowTransFilterObj.Free;
    ENSubst2PowTransFilterObj := nil;
  end;
end;

procedure TfrmENSubst150PowerTransEdit.actUpdateStationExecute(Sender: TObject);
var i, j: Integer;
  condition: string;
  ENSubstation150List: ENSubstation150ShortList;
  vENSubstation150Filter: ENSubstation150Filter;
  TempENSubstation150: ENSubstation150ControllerSoapPort;
begin //Обновление списка инвентарных номеров станций
  FormatSettings.DecimalSeparator := '.';
  SetGridHeaders(ENSubstation150Headers, sgENSubstation150.ColumnHeaders);

  for i := 1 to sgENSubstation150.RowCount - 1 do
    for j := 0 to sgENSubstation150.ColCount - 1 do
      sgENSubstation150.Cells[j, i] := '';

  ColCount := 100;
  TempENSubstation150 :=
    HTTPRIOENSubstation150 as ENSubstation150ControllerSoapPort;
  vENSubstation150Filter := ENSubstation150Filter.Create;
  SetNullIntProps(vENSubstation150Filter);
  SetNullXSProps(vENSubstation150Filter);
  condition := vENSubstation150Filter.conditionSQL;
  AddCondition(condition, '(ensubstation150.code in (' +
    '  select ensubst2powtrans.substationrefcode from ensubst2powtrans ' +
    '  where ensubst2powtrans.powertransrefcode = ' +
       IntToStr(vENSubst150PowerTransObjCode) + ') ' +
    'or ensubstation150.code = ' + IntToStr(vStationRefCode) +
    'or ensubstation150.code in (' +
    '  select ensubst150powertrans.substationrefcode ' +
    '  from ensubst150powertrans where ensubst150powertrans.code in (' +
    '    select ensubst2powtrans.powertransrefcode from ensubst2powtrans ' +
    '    where ensubst2powtrans.substationrefcode = ' +
         IntToStr(vStationRefCode) + ')))');

  vENSubstation150Filter.conditionSQL := condition;

  ENSubstation150List := TempENSubstation150.getScrollableFilteredList(
    vENSubstation150Filter, 0, ColCount);

  LastCount := High(ENSubstation150List.list);

  if LastCount > -1 then
    sgENSubstation150.RowCount := LastCount + 2
  else
    sgENSubstation150.RowCount := 2;

  with sgENSubstation150 do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubstation150List.list[i].code <> Low(Integer) then
        Cells[0, i + 1] := IntToStr(ENSubstation150List.list[i].code)
        else
        Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENSubstation150List.list[i].name;
        Cells[2, i + 1] := ENSubstation150List.list[i].invNumber;

        if ENSubstation150List.list[i].projectPower = nil then
          Cells[3, i + 1] := ''
        else
          Cells[3, i + 1] :=
            ENSubstation150List.list[i].projectPower.DecimalString;
        Cells[4, i + 1] := ENSubstation150List.list[i].operativeService;
        Cells[5, i + 1] := ENSubstation150List.list[i].repairService;
        Cells[6, i + 1] := ENSubstation150List.list[i].buhName;

        Cells[7, i + 1] :=
          IntToStr(ENSubstation150List.list[i].transformerCnt);
        LastRow := i + 1;
        sgENSubstation150.RowCount := LastRow + 1;
      end;
  ColCount := ColCount + 1;
  //if sgENSubstation150.Row = 1 then
  //  begin
  //    vStationLinkCode := StrToInt( //Задание кода связанной Станции
  //      sgENSubstation150.Cells[0, sgENSubstation150.Row]);
  //    actUpdateSubst150PowerTrans.Execute;
  //  end
  //else
    sgENSubstation150.Row := 1;
end;

procedure TfrmENSubst150PowerTransEdit.actUpdateSubst150PowerTransExecute(
  Sender: TObject); //Обновление списка связанных силовых трансформаторов
var //150 / 35 - 27 / 10 - 6 кВ через данную станцию или виртуальные
  TempENSubst150PowerTrans: ENSubst150PowerTransControllerSoapPort;
  i, j: Integer; ENSubst150PowerTransList: ENSubst150PowerTransShortList;
  vENSubst150PowerTransFilter: ENSubst150PowerTransFilter;
  condition: string;
begin
  for i := 1 to sgENSubst150PowerTrans.RowCount - 1 do
    for j := 0 to sgENSubst150PowerTrans.ColCount - 1 do
      sgENSubst150PowerTrans.Cells[j, i] := '';

  if vStationLinkCode = 0 then
    Exit;

  //vStationLinkCode := 0; //Инициализация
  SetGridHeaders(
    ENSubst150PowerTransHeaders, sgENSubst150PowerTrans.ColumnHeaders);

  //vStationLinkCode := StrToInt( //Задание кода связанной Станции
  //  sgENSubstation150.Cells[0, sgENSubstation150.Row]);

  ColCount := 100;
  TempENSubst150PowerTrans :=
    HTTPRIOENSubst150PowerTrans as ENSubst150PowerTransControllerSoapPort;

  vENSubst150PowerTransFilter := ENSubst150PowerTransFilter.Create;
  SetNullIntProps(vENSubst150PowerTransFilter);
  SetNullXSProps(vENSubst150PowerTransFilter);

  condition := vENSubst150PowerTransFilter.conditionSQL;
  AddCondition(condition,
    '(ensubst150powertrans.substationrefcode = ' + IntToStr(vStationLinkCode) +
    ' and ensubst150powertrans.code <> ' +
    IntToStr(vENSubst150PowerTransObjCode) + ')');
  vENSubst150PowerTransFilter.conditionSQL := condition;

  ENSubst150PowerTransList :=
    TempENSubst150PowerTrans.getScrollableFilteredList(
      vENSubst150PowerTransFilter, 0, ColCount);

  LastCount := High(ENSubst150PowerTransList.list);

  if LastCount > -1 then
    sgENSubst150PowerTrans.RowCount := LastCount + 2
  else
    sgENSubst150PowerTrans.RowCount := 2;

  with sgENSubst150PowerTrans do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150PowerTransList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENSubst150PowerTransList.list[i].code)
        else
        Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENSubst150PowerTransList.list[i].name;
        Cells[2, i + 1] := ENSubst150PowerTransList.list[i].factoryNumber;
        if ENSubst150PowerTransList.list[i].voltageVN = nil then
          Cells[3, i + 1] := ''
        else Cells[3, i + 1] :=
            ENSubst150PowerTransList.list[i].voltageVN.DecimalString;
        if ENSubst150PowerTransList.list[i].voltageSN = nil then
          Cells[4, i + 1] := ''
        else Cells[4, i + 1] :=
            ENSubst150PowerTransList.list[i].voltageSN.DecimalString;
        if ENSubst150PowerTransList.list[i].voltageNN = nil then
          Cells[5, i + 1] := ''
        else Cells[5, i + 1] :=
            ENSubst150PowerTransList.list[i].voltageNN.DecimalString;
        if ENSubst150PowerTransList.list[i].currentVN = nil then
          Cells[6, i + 1] := ''
        else Cells[6, i + 1] :=
            ENSubst150PowerTransList.list[i].currentVN.DecimalString;
        if ENSubst150PowerTransList.list[i].currentSN = nil then
          Cells[7, i + 1] := ''
        else Cells[7, i + 1] :=
            ENSubst150PowerTransList.list[i].currentSN.DecimalString;
        if ENSubst150PowerTransList.list[i].currentNN = nil then
          Cells[8, i + 1] := ''
        else Cells[8, i + 1] :=
            ENSubst150PowerTransList.list[i].currentNN.DecimalString;
        if ENSubst150PowerTransList.list[i].powerVN = nil then
          Cells[9, i + 1] := ''
        else Cells[9, i + 1] :=
            ENSubst150PowerTransList.list[i].powerVN.DecimalString;
        if ENSubst150PowerTransList.list[i].powerSN = nil then
          Cells[10, i + 1] := ''
        else Cells[10, i + 1] :=
            ENSubst150PowerTransList.list[i].powerSN.DecimalString;
        if ENSubst150PowerTransList.list[i].powerNN = nil then
          Cells[11, i + 1] := ''
        else Cells[11, i + 1] :=
            ENSubst150PowerTransList.list[i].powerNN.DecimalString;
        Cells[12, i + 1] := ENSubst150PowerTransList.list[i].commentGen;
        Cells[13, i + 1] := ENSubst150PowerTransList.list[i].userGen;
        LastRow:=i+1;
        sgENSubst150PowerTrans.RowCount:=LastRow+1;
      end;
   ColCount := ColCount + 1;
   sgENSubst150PowerTrans.Row := 1;
end;


procedure TfrmENSubst150PowerTransEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENSubst150PowerTrans: ENSubst150PowerTransControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName, edtENSubst150PowerTransType, edtENVoltageClass
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSubst150PowerTrans := HTTPRIOENSubst150PowerTrans as ENSubst150PowerTransControllerSoapPort;

    ENSubst150PowerTransObj.name := edtName.Text;
    ENSubst150PowerTransObj.factoryNumber := edtFactoryNumber.Text;

     if (ENSubst150PowerTransObj.voltageVN = nil ) then
       ENSubst150PowerTransObj.voltageVN := TXSDecimal.Create;
     if edtVoltageVN.Text <> '' then
       ENSubst150PowerTransObj.voltageVN.decimalString := edtVoltageVN.Text 
     else
       ENSubst150PowerTransObj.voltageVN := nil;

     if (ENSubst150PowerTransObj.voltageSN = nil ) then
       ENSubst150PowerTransObj.voltageSN := TXSDecimal.Create;
     if edtVoltageSN.Text <> '' then
       ENSubst150PowerTransObj.voltageSN.decimalString := edtVoltageSN.Text 
     else
       ENSubst150PowerTransObj.voltageSN := nil;

     if (ENSubst150PowerTransObj.voltageNN = nil ) then
       ENSubst150PowerTransObj.voltageNN := TXSDecimal.Create;
     if edtVoltageNN.Text <> '' then
       ENSubst150PowerTransObj.voltageNN.decimalString := edtVoltageNN.Text 
     else
       ENSubst150PowerTransObj.voltageNN := nil;

     if (ENSubst150PowerTransObj.currentVN = nil ) then
       ENSubst150PowerTransObj.currentVN := TXSDecimal.Create;
     if edtCurrentVN.Text <> '' then
       ENSubst150PowerTransObj.currentVN.decimalString := edtCurrentVN.Text 
     else
       ENSubst150PowerTransObj.currentVN := nil;

     if (ENSubst150PowerTransObj.currentSN = nil ) then
       ENSubst150PowerTransObj.currentSN := TXSDecimal.Create;
     if edtCurrentSN.Text <> '' then
       ENSubst150PowerTransObj.currentSN.decimalString := edtCurrentSN.Text 
     else
       ENSubst150PowerTransObj.currentSN := nil;

     if (ENSubst150PowerTransObj.currentNN = nil ) then
       ENSubst150PowerTransObj.currentNN := TXSDecimal.Create;
     if edtCurrentNN.Text <> '' then
       ENSubst150PowerTransObj.currentNN.decimalString := edtCurrentNN.Text 
     else
       ENSubst150PowerTransObj.currentNN := nil;

     if (ENSubst150PowerTransObj.powerVN = nil ) then
       ENSubst150PowerTransObj.powerVN := TXSDecimal.Create;
     if edtPowerVN.Text <> '' then
       ENSubst150PowerTransObj.powerVN.decimalString := edtPowerVN.Text 
     else
       ENSubst150PowerTransObj.powerVN := nil;

     if (ENSubst150PowerTransObj.powerSN = nil ) then
       ENSubst150PowerTransObj.powerSN := TXSDecimal.Create;
     if edtPowerSN.Text <> '' then
       ENSubst150PowerTransObj.powerSN.decimalString := edtPowerSN.Text 
     else
       ENSubst150PowerTransObj.powerSN := nil;

     if (ENSubst150PowerTransObj.powerNN = nil ) then
       ENSubst150PowerTransObj.powerNN := TXSDecimal.Create;
     if edtPowerNN.Text <> '' then
       ENSubst150PowerTransObj.powerNN.decimalString := edtPowerNN.Text 
     else
       ENSubst150PowerTransObj.powerNN := nil;

     ENSubst150PowerTransObj.commentGen := edtCommentGen.Text;

    if DialogState = dsInsert then
    begin
      ENSubst150PowerTransObj.code:=low(Integer);
      TempENSubst150PowerTrans.add(ENSubst150PowerTransObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150PowerTrans.save(ENSubst150PowerTransObj);
    end;
  end;
end;


procedure TfrmENSubst150PowerTransEdit.sgENSubstation150RowChanging(
  Sender: TObject; OldRow, NewRow: Integer; var Allow: Boolean);
begin
  vStationLinkCode := StrToInt( //Задание кода связанной Станции
    TAdvStringGrid(Sender).Cells[0, NewRow]);
  actUpdateSubst150PowerTrans.Execute;
end;


procedure TfrmENSubst150PowerTransEdit.spbENSubst150PowerTransTypeClick(Sender : TObject);
var
  frmENHighVoltHardwareTypeShow: TfrmENHighVoltHardwareTypeShow;
  highVoltHardwareTypeFilter: ENHighVoltHardwareTypeFilter;
begin
  highVoltHardwareTypeFilter := ENHighVoltHardwareTypeFilter.Create;
  SetNullIntProps(highVoltHardwareTypeFilter);
  SetNullXSProps(highVoltHardwareTypeFilter);
  highVoltHardwareTypeFilter.elementTypeRef := ENElementTypeRef.Create;
  highVoltHardwareTypeFilter.elementTypeRef.code := SUBST150_POWERTRANS_TYPE;

  frmENHighVoltHardwareTypeShow := TfrmENHighVoltHardwareTypeShow.Create(Application, fmNormal, highVoltHardwareTypeFilter);
  try
    with frmENHighVoltHardwareTypeShow do
    if ShowModal = mrOk then
    begin
      try
        ENSubst150PowerTransObj.typeRef := ENHighVoltHardwareTypeRef.Create;
        ENSubst150PowerTransObj.typeRef.code := StrToInt(GetReturnValue(sgENHighVoltHardwareType,0));
        edtENSubst150PowerTransType.Text := GetReturnValue(sgENHighVoltHardwareType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENHighVoltHardwareTypeShow.Free;
  end;
end;


procedure TfrmENSubst150PowerTransEdit.spbENVoltageClassClick(
  Sender: TObject);
var
   frmENVoltageClassShow: TfrmENVoltageClassShow;
begin
   frmENVoltageClassShow := TfrmENVoltageClassShow.Create(Application, fmNormal);
   try
      with frmENVoltageClassShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150PowerTransObj.voltageClassRef = nil then ENSubst150PowerTransObj.voltageClassRef := ENVoltageClassRef.Create;
               ENSubst150PowerTransObj.voltageClassRef.code := StrToInt(GetReturnValue(sgENVoltageClass,0));
               edtENVoltageClass.Text:=GetReturnValue(sgENVoltageClass,2);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENVoltageClassShow.Free;
   end;
end;

procedure TfrmENSubst150PowerTransEdit.spbENSubstation150Click(Sender: TObject);
begin //Указание Понижающей Станции 150 / 35 - 27 / 10 - 6 кВ

end;

procedure TfrmENSubst150PowerTransEdit.spbTkMaterialsClick(
  Sender: TObject);
var
  frmSpr_matherialShow : TfrmTKMaterialsShow;
  //mtFilter : TKMaterialsFilter;
begin
  if DialogState = dsView then Exit;
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);
  try
    with frmSpr_matherialShow do
    begin
      DisableActions([actInsert, actEdit, actDelete]);
      DenyGroupSelection := true;
      if ShowModal = mrOk then
      begin
        try
          if ENSubst150PowerTransObj.materialRef = nil then
            ENSubst150PowerTransObj.materialRef := TKMaterialsRef.Create;
          ENSubst150PowerTransObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialsName.Text := TKMaterialsShort(tvDep.Selected.Data).name;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

end.
