
unit EditRQAllocationListItem;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
  DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, RQAllocationListItemController,
  ExtCtrls, TB2Item, TB2Dock, TB2Toolbar, AdvObj ;

type
  TfrmRQAllocationListItemEdit = class(TDialogForm)

  HTTPRIORQAllocationListItem: THTTPRIO;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtMaterialName: TEdit;
    edtCountFact: TEdit;
    edtCountGen: TEdit;
    edtMeasurementName: TEdit;
    lblCountFact: TLabel;
    lblCountGen: TLabel;
    lblMeasurementName: TLabel;
    lblMaterialName: TLabel;
    btnCancel: TButton;
    btnOk: TButton;
    edtCode: TEdit;
    lblCode: TLabel;
    GroupBox2: TGroupBox;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actFINUpdate: TAction;
    actFINDelete: TAction;
    gbFINMaterials: TGroupBox;
    sgENFINMaterials: TAdvStringGrid;
    tbActions: TTBToolbar;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    TBToolbar1: TTBToolbar;
    TBItem2: TTBItem;
    sgRQFKOrderItem: TAdvStringGrid;
    TBItem3: TTBItem;
    HTTPRIOFINMaterials: THTTPRIO;
    HTTPRIORQFKOrderItem: THTTPRIO;
    actFkItemView: TAction;
    actRQFKOrderView: TAction;
    HTTPRIORQFKOrder: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure updateFINMaterialsGrid();
  procedure sgRQFKOrderItemClick(Sender: TObject);
  procedure UpdateGrid(Sender: TObject);
    procedure actFINUpdateExecute(Sender: TObject);
    procedure actFINDeleteExecute(Sender: TObject);
    procedure actFkItemViewExecute(Sender: TObject);
    procedure actRQFKOrderViewExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQAllocationListItemEdit: TfrmRQAllocationListItemEdit;
  RQAllocationListItemObj: RQAllocationListItem;

  RQFKOrderItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Норм. матеріал'
          ,'Норм. од.виміру'
          ,'Ном. номер матеріалу'
          ,'Назва матеріалу'
          ,'Од.виміру'
          ,'кількість'
          ,'ціна'
          ,'Сума'
          ,'Вага, кг'
          ,'Місце зберігання'
          ,'МВО'
        );

  FINMaterialsShortHeaders: array [1..16] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Од. виміру'
          ,'Номенклатурний номер'
          ,'Кількість'
          ,'Ціна'
          ,'Вартість'
          ,'код,назва ЦФВ'
          ,'МОЛ'
          ,'Призначення залишку'
          ,'Постачальник'
          ,'Дата постачання'
          ,'Опис постачання'
          ,'код партії'
          ,'користувач, що вніс зміни'
          ,'дата останньої зміни'
        );


implementation

uses FINMaterialsController, ENConsts, RQFKOrderItemController,
  EditRQFKOrderItem, EditRQFKOrder, RQFKOrderController;


{uses
    EnergyproController, EnergyproController2, RQAllocationListItemController  ;
}
{$R *.dfm}



procedure TfrmRQAllocationListItemEdit.FormShow(Sender: TObject);

begin

  SetGridHeaders(RQFKOrderItemHeaders, sgRQFKOrderItem.ColumnHeaders);
  SetGridHeaders(FINMaterialsShortHeaders, sgENFINMaterials.ColumnHeaders);

  if DialogState = dsView then
  begin
    DisableActions([actFINDelete]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtMaterialName, edtMeasurementName, edtCountGen, edtCountFact]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    DisableControls([edtMaterialName, edtMeasurementName, edtCountGen, edtCountFact]);

    edtCode.Text := IntToStr(RQAllocationListItemObj.code);
    edtMaterialName.Text := RQAllocationListItemObj.materialName;
    edtMeasurementName.Text := RQAllocationListItemObj.measurementName;

    if (RQAllocationListItemObj.countGen <> nil) then
       edtCountGen.Text := RQAllocationListItemObj.countGen.decimalString
    else
       edtCountGen.Text := '';
    if (RQAllocationListItemObj.countFact <> nil) then
       edtCountFact.Text := RQAllocationListItemObj.countFact.decimalString
    else
       edtCountFact.Text := '';
  end;

  UpdateGrid(Sender);
end;


procedure TfrmRQAllocationListItemEdit.sgRQFKOrderItemClick(Sender: TObject);
begin
  inherited;
  updateFINMaterialsGrid();
end;

procedure TfrmRQAllocationListItemEdit.actFINDeleteExecute(Sender: TObject);
var
  objCode, fkItemCode : Integer;
  TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
  fkOrderItem : RQFKOrderItem;
  TempRQAllocationListItem : RQAllocationListItemControllerSoapPort;
begin
  inherited;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити строку ??'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    objCode := LOW_INT;

    try
      objCode := StrToInt(sgENFINMaterials.Cells[0, sgENFINMaterials.Row]);
    except
      on EConvertError do Exit;
    end;

    try
      fkItemCode := StrToInt(sgRQFKOrderItem.Cells[0, sgRQFKOrderItem.Row]);
    except
      on EConvertError do Exit;
    end;

    TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
    fkOrderItem := TempRQFKOrderItem.getObject(fkItemCode);
    TempRQFKOrderItem.removeREM2MOL(objCode, fkOrderItem.fkOrderRef.code, true);

    TempRQAllocationListItem := HTTPRIORQAllocationListItem as RQAllocationListItemControllerSoapPort;
    RQAllocationListItemObj := TempRQAllocationListItem.getObject(RQAllocationListItemObj.code);
    if (RQAllocationListItemObj = nil) then
          ModalResult := mrOk
    else
      FormShow(Sender);
  end;
end;


procedure TfrmRQAllocationListItemEdit.actFINUpdateExecute(Sender: TObject);
begin
  inherited;
  updateFINMaterialsGrid();
end;


procedure TfrmRQAllocationListItemEdit.actFkItemViewExecute(Sender: TObject);
var
  TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
begin
  inherited;
  TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
  try
    RQFKOrderItemObj := TempRQFKOrderItem.getObject(StrToInt(sgRQFKOrderItem.Cells[0,sgRQFKOrderItem.Row]));
  except
    on EConvertError do Exit;
  end;
    frmRQFKOrderItemEdit := TfrmRQFKOrderItemEdit.Create(Application, dsView);
  try
    frmRQFKOrderItemEdit.ShowModal;
  finally
    frmRQFKOrderItemEdit.Free;
    frmRQFKOrderItemEdit:=nil;
  end;
end;


procedure TfrmRQAllocationListItemEdit.actRQFKOrderViewExecute(Sender: TObject);
var
  TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
  TempRQFKOrder : RQFKOrderControllerSoapPort;
  fkItem : RQFKOrderItem;
begin
  inherited;
  TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  try
    fkItem := TempRQFKOrderItem.getObject(StrToInt(sgRQFKOrderItem.Cells[0,sgRQFKOrderItem.Row]));
  except
    on EConvertError do Exit;
  end;
    frmRQFKOrderEdit := TfrmRQFKOrderEdit.Create(Application, dsView);
        frmRQFKOrderEdit.RQFKOrderObj := TempRQFKOrder.getObjectNoSegr(fkItem.fkOrderRef.code);
  try
    frmRQFKOrderEdit.ShowModal;
  finally
    frmRQFKOrderEdit.Free;
    frmRQFKOrderEdit:=nil;
  end;
end;

procedure TfrmRQAllocationListItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQAllocationListItem: RQAllocationListItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtMaterialName, edtMeasurementName, edtCountGen, edtCountFact]) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQAllocationListItem := HTTPRIORQAllocationListItem as RQAllocationListItemControllerSoapPort;

    if(RQAllocationListItemObj <> nil) then
    begin
    RQAllocationListItemObj.materialName := edtMaterialName.Text;
    RQAllocationListItemObj.measurementName := edtMeasurementName.Text;

    if (RQAllocationListItemObj.countGen = nil) then
      RQAllocationListItemObj.countGen := TXSDecimal.Create;
    if edtCountGen.Text <> '' then
      RQAllocationListItemObj.countGen.decimalString := edtCountGen.Text
    else
      RQAllocationListItemObj.countGen := nil;

    if (RQAllocationListItemObj.countFact = nil) then
      RQAllocationListItemObj.countFact := TXSDecimal.Create;
    if edtCountFact.Text <> '' then
      RQAllocationListItemObj.countFact.decimalString := edtCountFact.Text
    else
      RQAllocationListItemObj.countFact := nil;

    if DialogState = dsInsert then
    begin
      RQAllocationListItemObj.code:=low(Integer);
      TempRQAllocationListItem.add(RQAllocationListItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQAllocationListItem.save(RQAllocationListItemObj);
    end;
  end;
  end;
end;


procedure TfrmRQAllocationListItemEdit.updateFINMaterialsGrid();
var
  j, i, objCode : Integer;
  TempFINMaterials : FINMaterialsControllerSoapPort;
  finList : FINMaterialsShortList;
  finFilter : FINMaterialsFilter;
begin
  for i:=1 to sgENFINMaterials.RowCount-1 do
    for j:=0 to sgENFINMaterials.ColCount-1 do
      sgENFINMaterials.Cells[j,i]:='';
  try
    objCode := StrToInt(sgRQFKOrderItem.Cells[0,sgRQFKOrderItem.Row]);
  except
    on EConvertError do Exit;
  end;

  finFilter := FINMaterialsFilter.Create;
  SetNullIntProps(finFilter);
  SetNullXSProps(finFilter);

  finFilter.conditionSQL := 'finmaterials.statusrefcode in (' +
                             IntToStr(FINMATERIALSSTATUS_GOOD) + ', ' + IntToStr(FINMATERIALSSTATUS_MOVED) + ', ' +
                             IntToStr(CORRECTREASON_MOVE_TO_FACT) +
                            ') and finmaterials.code in '+
                            '(select RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE from RQFKORDERITEM2ENSTMTTM ' +
                            ' where RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE = ' + IntToStr(objCode) + ')';

  TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

  finList := TempFINMaterials.getScrollableFilteredList(finFilter,0,-1);

  if High(finList.list) > -1 then
     sgENFINMaterials.RowCount:=High(finList.list)+2
  else
     sgENFINMaterials.RowCount:=2;

   with sgENFINMaterials do
    for i:=0 to High(finList.list) do
      begin
        Application.ProcessMessages;
        if finList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(finList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := finList.list[i].mat_name;
        Cells[2,i+1] := finList.list[i].mu_name;
        Cells[3,i+1] := finList.list[i].nn;

        if finList.list[i].quantity = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := finList.list[i].quantity.DecimalString;

        if finList.list[i].calc_price = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := finList.list[i].calc_price.DecimalString;

        if finList.list[i].cost = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := finList.list[i].cost.DecimalString;

        Cells[7, i+1] := IntToStr(finList.list[i].frc_code) + ' ' + finList.list[i].frc_name;
        Cells[8,i+1] := finList.list[i].div_name;
        Cells[9,i+1] := finList.list[i].rest_purpose_name;
        Cells[10,i+1] := finList.list[i].partner_name;

        if finList.list[i].doc_date = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := XSDate2String(finList.list[i].doc_date);

        Cells[12,i+1] := finList.list[i].party_discription;
        Cells[13,i+1] := IntToStr(finList.list[i].party_id);
        Cells[14, i+1] := finList.list[i].userGen ;

        if finList.list[i].dateEdit <> nil then
          Cells[15, i+1] := XSDateTimeWithDate2String(finList.list[i].dateEdit)
        else
          Cells[15, i+1] := '';

        sgENFINMaterials.RowCount:= i + 2;
      end;

   sgENFINMaterials.Row:=1;
end;



procedure TfrmRQAllocationListItemEdit.UpdateGrid(Sender: TObject);
var
  i : Integer;
  TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
  RQFKOrderItemList : RQFKOrderItemShortList;
  RQFKOrderItemFilterObj : RQFKOrderItemFilter;
begin
  RQFKOrderItemFilterObj := RQFKOrderItemFilter.Create;
  SetNullIntProps(RQFKOrderItemFilterObj);
  SetNullXSProps(RQFKOrderItemFilterObj);
  RQFKOrderItemFilterObj.conditionSQL :=
    ' rqfkorderitem.code in (select l2oi.fkorderitemrefcode ' +
    ' from rqalloclistitm2fkrdrtm l2oi where l2oi.listitemrefcode = ' + IntToStr(RQAllocationListItemObj.code) + ')';

  TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
  RQFKOrderItemList := TempRQFKOrderItem.getScrollableFilteredList(RQFKOrderItemFilterObj,0,-1);

  if High(RQFKOrderItemList.list) > -1 then
    sgRQFKOrderItem.RowCount:=High(RQFKOrderItemList.list)+2
  else
    sgRQFKOrderItem.RowCount:=2;

  with sgRQFKOrderItem do
  for i:=0 to High(RQFKOrderItemList.list) do
    begin
      Application.ProcessMessages;

      if RQFKOrderItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderItemList.list[i].code)
      else
        Cells[0,i+1] := '';

      Cells[1, i+1] := RQFKOrderItemList.list[i].materialName;
      Cells[2, i+1] := RQFKOrderItemList.list[i].measurementName;
      Cells[3, i+1] := RQFKOrderItemList.list[i].nomenclatureNum;
      Cells[4, i+1] := RQFKOrderItemList.list[i].nomenclatureName;
      Cells[5, i+1] := RQFKOrderItemList.list[i].nomenclatureUnitName;

      if RQFKOrderItemList.list[i].countGen = nil then
        Cells[6,i+1] := ''
      else
      begin
        Cells[6,i+1] := RQFKOrderItemList.list[i].countGen.DecimalString;
      end;

      Cells[7,i+1] := RQFKOrderItemList.list[i].priceWithoutNds.DecimalString;
      Cells[8,i+1] := RQFKOrderItemList.list[i].sumWithoutNds.DecimalString;

      if (RQFKOrderItemList.list[i].weight = nil) then
        Cells[9,i+1] := ''
      else
        Cells[9,i+1] := RQFKOrderItemList.list[i].weight.DecimalString;

      Cells[10, i+1] := RQFKOrderItemList.list[i].storageZoneShortName;

      Cells[11, i+1] := RQFKOrderItemList.list[i].fkOrderRefMolInCode + ' ' + RQFKOrderItemList.list[i].fkOrderRefMolInName;

      sgRQFKOrderItem.RowCount:= i + 2;
    end;

    sgRQFKOrderItem.Row:=1;

  Application.ProcessMessages;
  sgRQFKOrderItemClick(Sender);
end;


end.