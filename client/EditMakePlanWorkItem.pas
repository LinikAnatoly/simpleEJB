
unit EditMakePlanWorkItem;
 
interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ExtCtrls, AdvObj;

type
    TfrmMakePlanWorkItemEdit = class(TDialogForm)

    btnOk: TButton;
    btnCancel: TButton;
    pnGeneral: TPanel;
    ImageList1: TImageList;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    sgENPlanWorkItem: TAdvStringGrid;
    HTTPRIOENPlanWork: THTTPRIO;
    gbWorkOrderMOL: TGroupBox;
    Label5: TLabel;
    spbMaster: TSpeedButton;
    spbMasterClear: TSpeedButton;
    lblMolMech: TLabel;
    spbMechanic: TSpeedButton;
    spbMechanicClear: TSpeedButton;
    edtMasterName: TEdit;
    edtMechanicName: TEdit;
    edtCode: TEdit;
    lblPK: TLabel;
    HTTPRIOENDepartment: THTTPRIO;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    edtDateGen: TDateTimePicker;
    lblDateGen: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgENPlanWorkItemGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure sgENPlanWorkItemCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: string; var Valid: Boolean);
    procedure sgENPlanWorkItemGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure btnOkClick(Sender: TObject);
    procedure spbMasterClick(Sender: TObject);
    procedure spbMechanicClearClick(Sender: TObject);
    procedure spbMasterClearClick(Sender: TObject);
    procedure spbMechanicClick(Sender: TObject);

  private
    { Private declarations }
    createEnabled: Boolean;
    totalCountWorks, possibleCountGen: Double;
  public
    { Public declarations }
    planCode: Integer;
    departmentCode : Integer;
    masterName,  mechanicName, masterCode,  mechanicCode : string;

end;

var
  frmMakePlanWorkItemEdit: TfrmMakePlanWorkItemEdit;

  ENPlanWorkItemHeaders: array [1..8] of String =
        ( 'Код'
          ,'Код роботи'
          ,'Робота'
          ,'У місячному плані'
          ,'Загальна кількість виконаних робіт - Факти'
          ,'Чорнові завдання - плани'
          ,''
          ,'Можлива кількість робіт для виконання'
        );

implementation

uses ENPlanWorkItemController, ENPlanWorkController, ENConsts, ShowENDepartment,
  ENDepartmentController, ENDepartment2EPRenController, ShowFINMol,
  FINMolController;


{$R *.dfm}


procedure TfrmMakePlanWorkItemEdit.btnOkClick(Sender: TObject);
var
  i, m, n: Integer;
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  planWorkItemArr: ArrayOfENPlanWorkItemShort;
  planWorkItemObj: ENPlanWorkItemShort;
  planDate : TXSDate;
begin
  inherited;

  if not NoBlankValues([
      edtDateGen
      ,edtMasterName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      ModalResult := mrNone;
  end
  else
  begin

  if createEnabled then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    m := 0;
    n := 0;
    for i:=1 to sgENPlanWorkItem.RowCount - 1 do
    begin
      SetLength(planWorkItemArr, m + 1);
      m := m + 1;

      planWorkItemObj := ENPlanWorkItemShort.Create;
      SetNullIntProps(planWorkItemObj);
      SetNullXSProps(planWorkItemObj);

      planWorkItemObj.code := LOW_INT;
      planWorkItemObj.kartaRefCode := StrToInt(sgENPlanWorkItem.Cells[0, i]);
      if (planWorkItemObj.countGen = nil) then planWorkItemObj.countGen := TXSDecimal.Create;
      planWorkItemObj.countGen.DecimalString := sgENPlanWorkItem.Cells[7, i];

      planWorkItemArr[n] := planWorkItemObj;
      n := n + 1;
    end;



    if edtDateGen.Checked then
    begin
    planDate := TXSDate.Create;
    planDate.XSToNative(GetXSDate(edtDateGen.DateTime));
    end;

       TempENPlanWork.closePlanWorkWithParams(planCode, planDate,
                masterCode, masterName, mechanicCode, mechanicName, planWorkItemArr);

    ModalResult := mrOk;
    end else
    ModalResult := mrCancel;
  end;
end;


procedure TfrmMakePlanWorkItemEdit.FormCreate(Sender: TObject);
begin
  inherited;
  planCode := Low(Integer);
  createEnabled := True;
end;


procedure TfrmMakePlanWorkItemEdit.FormShow(Sender: TObject);
var
  i, LastCount, LastRow, ColCount : Integer;
  TempENPlanWorkItem : ENPlanWorkItemControllerSoapPort;
  planWorkItemForClosePlanList : ENPlanWorkItemForClosePlanShortList;
begin
  inherited;
  if planCode = Low(Integer) then Exit;

  edtDateGen.Enabled := True;
  SetCurrentDate;

  SetGridHeaders(ENPlanWorkItemHeaders, sgENPlanWorkItem.ColumnHeaders);
  sgENPlanWorkItem.SortSettings.Show := False;

  totalCountWorks := 0;

  sgENPlanWorkItem.Options := sgENPlanWorkItem.Options - [goColMoving];
  sgENPlanWorkItem.Options := sgENPlanWorkItem.Options + [goEditing];
  sgENPlanWorkItem.ColWidths[6] := 0;
  sgENPlanWorkItem.ColWidths[7] := 96;

  TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
  planWorkItemForClosePlanList := TempENPlanWorkItem.getPlanWorkItemForClosePlanList(planCode);
  LastCount := High(planWorkItemForClosePlanList.list);

  if LastCount > -1 then
    sgENPlanWorkItem.RowCount := LastCount+2
  else
    sgENPlanWorkItem.RowCount := 2;

     with sgENPlanWorkItem do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;

          if planWorkItemForClosePlanList.list[i].kartaRefCode <> Low(Integer) then
            Cells[0,i+1] := IntToStr(planWorkItemForClosePlanList.list[i].kartaRefCode)
          else
            Cells[0,i+1] := '';
          CellProperties[0, i+1].ReadOnly := True;
          CellProperties[0, i+1].FontStyle := CellProperties[0, i+1].FontStyle - [fsBold];

          Cells[1,i+1] := planWorkItemForClosePlanList.list[i].kartaNum;
          CellProperties[1, i+1].ReadOnly := True;
          CellProperties[1, i+1].FontStyle := CellProperties[1, i+1].FontStyle - [fsBold];

          Cells[2,i+1] := planWorkItemForClosePlanList.list[i].kartaRefName;
          CellProperties[2, i+1].ReadOnly := True;
          CellProperties[2, i+1].FontStyle := CellProperties[2, i+1].FontStyle - [fsBold];

          if planWorkItemForClosePlanList.list[i].monthPlanCountGen = nil then
            Cells[3,i+1] := ''
          else
            Cells[3,i+1] := planWorkItemForClosePlanList.list[i].monthPlanCountGen.DecimalString;
          CellProperties[3, i+1].ReadOnly := True;
          CellProperties[3, i+1].FontStyle := CellProperties[3, i+1].FontStyle - [fsBold];

          if planWorkItemForClosePlanList.list[i].factCountGen = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := planWorkItemForClosePlanList.list[i].factCountGen.DecimalString;
          CellProperties[4, i+1].ReadOnly := True;
          CellProperties[4, i+1].FontStyle := CellProperties[4, i+1].FontStyle - [fsBold];

          if planWorkItemForClosePlanList.list[i].npzCountGen = nil then
            Cells[5,i+1] := ''
          else
            Cells[5,i+1] := planWorkItemForClosePlanList.list[i].npzCountGen.DecimalString;
          CellProperties[5, i+1].ReadOnly := True;
          CellProperties[5, i+1].FontStyle := CellProperties[5, i+1].FontStyle - [fsBold];


          if planWorkItemForClosePlanList.list[i].possibleCountGen = nil then
            Cells[6,i+1] := ''
          else
            Cells[6,i+1] := planWorkItemForClosePlanList.list[i].possibleCountGen.DecimalString;


          if planWorkItemForClosePlanList.list[i].possibleCountGen = nil then
          begin
            Cells[7,i+1] := '';
            CellProperties[7, i+1].ReadOnly := True;
          end else
          begin
            try
              possibleCountGen := StrToFloat(planWorkItemForClosePlanList.list[i].possibleCountGen.DecimalString);
            except
              possibleCountGen := 0;
            end;
            // если все работы выполнены - лочим
            if (possibleCountGen > 0) then
            begin
              Cells[7,i+1] := planWorkItemForClosePlanList.list[i].possibleCountGen.DecimalString;
              CellProperties[7, i+1].ReadOnly := False;
              Colors[7, i+1] := clYellow;
            end else
            begin
              Cells[7,i+1] := planWorkItemForClosePlanList.list[i].possibleCountGen.DecimalString;
              CellProperties[7, i+1].ReadOnly := True;
              Colors[7, i+1] := clGray;
            end;

          end;

          totalCountWorks := totalCountWorks + possibleCountGen;
          CellProperties[7, i+1].FontStyle := CellProperties[7, i+1].FontStyle - [fsBold];



          LastRow := i+1;
          sgENPlanWorkItem.RowCount := LastRow+1;

        end;

     ColCount := ColCount + 1;
     sgENPlanWorkItem.Row := 1;


    if (totalCountWorks = 0) then
    begin
      createEnabled := False;
      btnOk.Enabled := False;
      Application.MessageBox(PChar('Обсяг планових робіт згідно місячного плану повністю виконаний!' + #13 + 'При необхідності використовуйте непланові роботи.'), PChar('Увага!'), MB_ICONINFORMATION);
    end;

end;


procedure TfrmMakePlanWorkItemEdit.sgENPlanWorkItemCellValidate(Sender: TObject;
  ACol, ARow: Integer; var Value: string; var Valid: Boolean);
begin
  inherited;
  if ACol <> 7 then Exit;

  if StrToFloat(sgENPlanWorkItem.Cells[7, ARow]) > StrToFloat(sgENPlanWorkItem.Cells[6, ARow]) then
  begin
    Valid := False;
    Value := sgENPlanWorkItem.Cells[6, ARow];
    Application.MessageBox(PChar('Кількість робіт не повинна перевищувати значення: "' + Value + '"!'), PChar('Помилка!'), MB_ICONERROR);
    Exit;
  end;
end;


procedure TfrmMakePlanWorkItemEdit.sgENPlanWorkItemGetAlignment(Sender: TObject;
  ARow, ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
	if ARow = 0 then
  begin
    // VAlign := vtaCenter;
    // VAlign := vtaTop;
    VAlign := vtaBottom;
    HAlign := taCenter;
	end;
end;


procedure TfrmMakePlanWorkItemEdit.sgENPlanWorkItemGetEditorType(
  Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
begin
  inherited;
  if (ACol = 7) then
  begin
    AEditor := edFloatSpinEdit;
    sgENPlanWorkItem.SpinEdit.Precision := 3;
    sgENPlanWorkItem.SpinEdit.MinFloatValue := 0.000;
    // sgENPlanWorkItem.SpinEdit.MaxFloatValue := 1;
    sgENPlanWorkItem.SpinEdit.IncrementFloat := 0.001;
  end;
end;

procedure TfrmMakePlanWorkItemEdit.spbMasterClearClick(Sender: TObject);
begin
  inherited;
  masterCode := '';
  masterName := '';
  edtMasterName.Text := '';
end;

procedure TfrmMakePlanWorkItemEdit.spbMasterClick(Sender: TObject);
var
  f: FINMolFilter;
  frmFINMolShow: TfrmFINMolShow;

  TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  //ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter: ENDepartment2EPRenFilter;
  renList: ENDepartment2EPRenShortList;

  //molSel: boolean;
begin
  f := FINMolFilter.Create;
  SetNullXSProps(f);
  SetNullIntProps(f);
  f.state := 1; // типа только работающие ...

  if departmentCode <> LOW_INT then
  begin
    renFilter := ENDepartment2EPRenFilter.Create;
    SetNullXSProps(renFilter);
    SetNullIntProps(renFilter);

    renFilter.departmentRef := ENDepartmentRef.Create;
    renFilter.departmentRef.code := departmentCode;

    TempENDepartment2EPRen := HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;

    renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);

    if renList.totalCount > 0 then
      f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode);
  end;

  frmFINMolShow := TfrmFINMolShow.Create(Application, fmNormal, f);
  try
    if Length(f.conditionSQL) > 0 then
      frmFINMolShow.isFiltered := true;

    with frmFINMolShow do
    begin
      DisableActions([frmFINMolShow.actEdit, frmFINMolShow.actInsert]);
      if ShowModal = mrOk then
      begin
        masterCode := GetReturnValue(sgFINMol, 0);
        masterName := GetReturnValue(sgFINMol, 1);

        edtMasterName.Text := masterCode + ' ' + masterName;

      end;
    end;
  finally
    frmFINMolShow.Free;
  end;
end;

procedure TfrmMakePlanWorkItemEdit.spbMechanicClearClick(Sender: TObject);
begin
  inherited;
  mechanicCode := '';
  mechanicName := '';
  edtMechanicName.Text := '';
end;

procedure TfrmMakePlanWorkItemEdit.spbMechanicClick(Sender: TObject);
var
  f: FINMolFilter;
  frmFINMolShow: TfrmFINMolShow;

  TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  //ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter: ENDepartment2EPRenFilter;
  renList: ENDepartment2EPRenShortList;

  //molSel: boolean;
begin
  f := FINMolFilter.Create;
  SetNullXSProps(f);
  SetNullIntProps(f);
  f.state := 1; // типа только работающие ...

  if departmentCode <> LOW_INT then
  begin
    renFilter := ENDepartment2EPRenFilter.Create;
    SetNullXSProps(renFilter);
    SetNullIntProps(renFilter);

    renFilter.departmentRef := ENDepartmentRef.Create;
    renFilter.departmentRef.code := departmentCode;

    TempENDepartment2EPRen := HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;

    renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);

    if renList.totalCount > 0 then
      f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode);
  end;

  frmFINMolShow := TfrmFINMolShow.Create(Application, fmNormal, f);
  try
    if Length(f.conditionSQL) > 0 then
      frmFINMolShow.isFiltered := true;

    with frmFINMolShow do
    begin
      DisableActions([frmFINMolShow.actEdit, frmFINMolShow.actInsert]);
      if ShowModal = mrOk then
      begin
        mechanicCode := GetReturnValue(sgFINMol, 0);
        mechanicName := GetReturnValue(sgFINMol, 1);

        edtMechanicName.Text := mechanicCode + ' ' + mechanicName;
      end;
    end;
  finally
    frmFINMolShow.Free;
  end;
end;

end.
