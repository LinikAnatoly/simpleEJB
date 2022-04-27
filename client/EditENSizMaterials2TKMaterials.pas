
unit EditENSizMaterials2TKMaterials;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSizMaterials2TKMaterialsController, AdvObj;

type
    TfrmENSizMaterials2TKMaterialsEdit = class(TDialogForm)

    lblCode : TLabel;
    edtCode : TEdit;

    HTTPRIOENSizMaterials2TKMaterials: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    edtSizMaterial: TEdit;
    lblSizMaterial: TLabel;
    lblRealMaterial: TLabel;
    edtRealMaterial: TEdit;
    spbTKMaterials: TSpeedButton;
    sgENSizMaterials2TKMaterials: TAdvStringGrid;
    Label1: TLabel;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbTKMaterialsClick(Sender: TObject);
    procedure fillMaterialsGrid(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSizMaterials2TKMaterialsEdit: TfrmENSizMaterials2TKMaterialsEdit;
  ENSizMaterials2TKMaterialsObj: ENSizMaterials2TKMaterials;


implementation


{$R *.dfm}


uses ShowTKMaterials
  , TKMaterialsController
  , ENElementController
;


var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSizMaterials2TKMaterialsHeaders: array [1..4] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Користувач, який змінив запис'
          ,'Дата зміни'
        );



procedure TfrmENSizMaterials2TKMaterialsEdit.FormShow(Sender: TObject);
var
  TempENSizMaterials2TKMaterials: ENSizMaterials2TKMaterialsControllerSoapPort;
  sizMaterials2TKMaterialsShort: ENSizMaterials2TKMaterialsShort;
begin
  TempENSizMaterials2TKMaterials := HTTPRIOENSizMaterials2TKMaterials as ENSizMaterials2TKMaterialsControllerSoapPort;
  SetGridHeaders(ENSizMaterials2TKMaterialsHeaders, sgENSizMaterials2TKMaterials.ColumnHeaders);
  ClearGrid(sgENSizMaterials2TKMaterials);

  fillMaterialsGrid(Sender);

  if (DialogState = dsView) then
  begin
    DisableControls([spbTKMaterials]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtCode, edtSizMaterial]);
    DenyBlankValues([edtRealMaterial]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    sizMaterials2TKMaterialsShort := TempENSizMaterials2TKMaterials.getShortObject(ENSizMaterials2TKMaterialsObj.code);

    edtCode.Text := IntToStr(ENSizMaterials2TKMaterialsObj.code);
    edtSizMaterial.Text := sizMaterials2TKMaterialsShort.sizMaterialsRefName;
    edtRealMaterial.Text := sizMaterials2TKMaterialsShort.tkMaterialsRefName;
  end;
end;


procedure TfrmENSizMaterials2TKMaterialsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENSizMaterials2TKMaterials: ENSizMaterials2TKMaterialsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtRealMaterial])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSizMaterials2TKMaterials := HTTPRIOENSizMaterials2TKMaterials as ENSizMaterials2TKMaterialsControllerSoapPort;

    if DialogState = dsInsert then
    begin
      ENSizMaterials2TKMaterialsObj.code := Low(Integer);
      TempENSizMaterials2TKMaterials.add(ENSizMaterials2TKMaterialsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSizMaterials2TKMaterials.save(ENSizMaterials2TKMaterialsObj);
    end;
  end;
end;


procedure TfrmENSizMaterials2TKMaterialsEdit.spbTKMaterialsClick(Sender: TObject);
var
  frmSpr_matherialShow: TfrmTKMaterialsShow;
  mtFilter: TKMaterialsFilter;
begin
  if DialogState = dsView then Exit;

  mtFilter := TKMaterialsFilter.Create;
  SetNullIntProps(mtFilter);
  SetNullXSProps(mtFilter);
  mtFilter.conditionSQL := 'tk1.parentrefcode = ' + IntToStr(ENSizMaterials2TKMaterialsObj.sizMaterialsRef.code);
  mtFilter.orderBySQL := ' tk1.name';
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal, mtFilter);

  try
    with frmSpr_matherialShow do
    begin
      // NET-73 Закрываем любое редактирование материалов (оставляем только просмотр)
      // (для редактирования есть отдельный клиент!)
      DisableActions([actInsert, actEdit, actDelete]);

      DenyGroupSelection := true;

      if ShowModal = mrOk then
      begin
        try
          if ENSizMaterials2TKMaterialsObj.tkMaterialsRef = nil then ENSizMaterials2TKMaterialsObj.tkMaterialsRef := TKMaterialsRef.Create;
          ENSizMaterials2TKMaterialsObj.tkMaterialsRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
          edtRealMaterial.Text := TKMaterialsShort(tvDep.Selected.Data).name;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;


procedure TfrmENSizMaterials2TKMaterialsEdit.fillMaterialsGrid(Sender: TObject);
var
  i: Integer;
  TempENSizMaterials2TKMaterials: ENSizMaterials2TKMaterialsControllerSoapPort;
  ENSizMaterials2TKMaterialsList: ENSizMaterials2TKMaterialsShortList;
  sizMaterials2TKMaterialsFilter: ENSizMaterials2TKMaterialsFilter;
begin
  if ENSizMaterials2TKMaterialsObj = nil then Exit;
  if ENSizMaterials2TKMaterialsObj.sizMaterialsRef = nil then Exit;
  if ENSizMaterials2TKMaterialsObj.sizMaterialsRef.code = Low(Integer) then Exit;

  TempENSizMaterials2TKMaterials := HTTPRIOENSizMaterials2TKMaterials as ENSizMaterials2TKMaterialsControllerSoapPort;

  sizMaterials2TKMaterialsFilter := ENSizMaterials2TKMaterialsFilter.Create;
  SetNullIntProps(sizMaterials2TKMaterialsFilter);
  SetNullXSProps(sizMaterials2TKMaterialsFilter);

  sizMaterials2TKMaterialsFilter.sizMaterialsRef := TKMaterialsRef.Create;
  sizMaterials2TKMaterialsFilter.sizMaterialsRef.code := ENSizMaterials2TKMaterialsObj.sizMaterialsRef.code;
  sizMaterials2TKMaterialsFilter.elementRef := ENElementRef.Create;
  sizMaterials2TKMaterialsFilter.elementRef.code := ENSizMaterials2TKMaterialsObj.elementRef.code;


  ENSizMaterials2TKMaterialsList := TempENSizMaterials2TKMaterials.getScrollableFilteredList(sizMaterials2TKMaterialsFilter,0,-1);
  LastCount:=High(ENSizMaterials2TKMaterialsList.list);

  if LastCount > -1 then
     sgENSizMaterials2TKMaterials.RowCount:=LastCount+2
  else
     sgENSizMaterials2TKMaterials.RowCount:=2;

   with sgENSizMaterials2TKMaterials do
    for i:=0 to LastCount do
      begin
        if ENSizMaterials2TKMaterialsList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENSizMaterials2TKMaterialsList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENSizMaterials2TKMaterialsList.list[i].tkMaterialsRefName;
        Cells[2,i+1] := ENSizMaterials2TKMaterialsList.list[i].userEdit;

        if ENSizMaterials2TKMaterialsList.list[i].dateEdit = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDateTimeWithDate2String(ENSizMaterials2TKMaterialsList.list[i].dateEdit);

        LastRow:=i+1;
        sgENSizMaterials2TKMaterials.RowCount:=LastRow+1;
      end;

    ColCount:=ColCount+1;
    sgENSizMaterials2TKMaterials.Row:=1;
end;


end.