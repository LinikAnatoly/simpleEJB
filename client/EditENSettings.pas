
unit EditENSettings;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSettingsController, ENSettingsValuesController, AdvObj,
  TB2Item, TB2Dock, TB2Toolbar ;

type
  TfrmENSettingsEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblKey : TLabel;
    edtKey: TEdit;
    lblComment : TLabel;
    edtComment: TMemo;


  HTTPRIOENSettings: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actValueView: TAction;
    actValueInsert: TAction;
    actValueDelete: TAction;
    actValueEdit: TAction;
    gbValueEntry: TGroupBox;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    sgENSettingsValues: TAdvStringGrid;
    HTTPRIOENSettingsValues: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure UpdateValuesGrid(Sender: TObject);
    procedure actValueViewExecute(Sender: TObject);
    procedure actValueInsertExecute(Sender: TObject);
    procedure actValueDeleteExecute(Sender: TObject);
    procedure actValueEditExecute(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSettingsEdit: TfrmENSettingsEdit;
  ENSettingsObj: ENSettings;
  ENSettingsValuesHeaders: array [1..4] of String =
        ( 'Код'
          ,'Значення'
          ,'Початок дії'
          ,'Кінець дії'
        );

implementation

uses EditENSettingsValues;


{uses
    EnergyproController, EnergyproController2, ENSettingsController  ;
}
{$R *.dfm}


procedure TfrmENSettingsEdit.UpdateValuesGrid(Sender: TObject);
var
  TempENSettingsValues : ENSettingsValuesControllerSoapPort;
  ENSettingsValuesList : ENSettingsValuesShortList;
  valuesFilter : ENSettingsValuesFilter;
  LastCount, i : Integer;
  item : ENSettingsValuesShort;
begin
  sgENSettingsValues.Clear;
  SetGridHeaders(ENSettingsValuesHeaders, sgENSettingsValues.ColumnHeaders);
  TempENSettingsValues := HTTPRIOENSettingsValues as ENSettingsValuesControllerSoapPort;
  if (ENSettingsObj = nil) or (ENSettingsObj.code = Low(Integer)) then Exit;
  if DialogState = dsInsert then Exit;

  valuesFilter := ENSettingsValuesFilter.Create;
  SetNullIntProps(valuesFilter);
  SetNullXSProps(valuesFilter);

  valuesFilter.settingsRef := ENSettingsRef.Create;
  valuesFilter.settingsRef.code := ENSettingsObj.code;

  valuesFilter.orderBySQL := 'COALESCE(DATEFINAL, TO_DATE(''31.12.9999'', ''dd.mm.yyy'')) ASC';

  ENSettingsValuesList := TempENSettingsValues.getScrollableFilteredList(valuesFilter,0,-1);
  LastCount:=High(ENSettingsValuesList.list);

  if LastCount > -1 then
    sgENSettingsValues.RowCount:=LastCount+2
  else
    sgENSettingsValues.RowCount:=2;

    i := 0;
  with sgENSettingsValues do begin
    for  item in ENSettingsValuesList.list do begin
      if item.code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(item.code)
      else
        Cells[0,i+1] := '';

      Cells[1, i+1] := item.value;

      if item.dateStart = nil then
        Cells[2,i+1] := ''
      else
        Cells[2,i+1] := XSDate2String(item.dateStart);

      if item.dateFinal = nil then
        Cells[3,i+1] := ''
      else
        Cells[3,i+1] := XSDate2String(item.dateFinal);

      i := i + 1;
    end;

  end;



end;
procedure TfrmENSettingsEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtCode]);
  DisableActions([actValueEdit, actValueInsert, actValueDelete], DialogState <> dsEdit);

  if DialogState = dsView then
  begin
    DisableActions([actValueEdit, actValueInsert, actValueDelete], DialogState <> dsEdit);
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([gbValueEntry]);
    lblCode.Top := 115;
    edtCode.Top := 113;
    btnOk.Top := 106;
    btnCancel.Top := 106;
    Self.Width := 540;
    Self.Height := 200;
  end;

  gbValueEntry.Visible := (DialogState <> dsInsert);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtKey, edtComment
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSettingsObj.code);
    edtKey.Text := ENSettingsObj.key; 
    MakeMultiline(edtComment.Lines, ENSettingsObj.comment);
    UpdateValuesGrid(Sender);


  end;
end;



procedure TfrmENSettingsEdit.actValueDeleteExecute(Sender: TObject);
var
  TempENSettingsValues : ENSettingsValuesControllerSoapPort;
  ObjCode : Integer;
begin

  TempENSettingsValues := HTTPRIOENSettingsValues as ENSettingsValuesControllerSoapPort;
  try
    ObjCode := StrToInt(sgENSettingsValues.Cells[0,sgENSettingsValues.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити значення для цього налаштування?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENSettingsValues.remove(ObjCode);
  end;

  FormShow(Sender);
end;

procedure TfrmENSettingsEdit.actValueEditExecute(Sender: TObject);
var
  TempENSettingsValues : ENSettingsValuesControllerSoapPort;
begin
  TempENSettingsValues := HTTPRIOENSettingsValues as ENSettingsValuesControllerSoapPort;
  try
    ENSettingsValuesObj := TempENSettingsValues.getObject(StrToInt(sgENSettingsValues.Cells[0,sgENSettingsValues.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENSettingsValuesEdit := TfrmENSettingsValuesEdit.Create(Application, dsEdit);
  try
    if frmENSettingsValuesEdit.ShowModal= mrOk then
      begin
        FormShow(Sender);
      end;
  finally
    frmENSettingsValuesEdit.Free;
    frmENSettingsValuesEdit:=nil;
  end;
end;

procedure TfrmENSettingsEdit.actValueInsertExecute(Sender: TObject);
begin
  ENSettingsValuesObj := ENSettingsValues.Create;
  ENSettingsValuesObj.settingsRef := ENSettingsRef.Create;
  ENSettingsValuesObj.settingsRef.code := ENSettingsObj.code;

  try
    frmENSettingsValuesEdit := TfrmENSettingsValuesEdit.Create(Application, dsInsert);
    try
      if frmENSettingsValuesEdit.ShowModal = mrOk then
      begin
        if ENSettingsValuesObj<>nil then
            FormShow(Sender);
      end;
    finally
      frmENSettingsValuesEdit.Free;
      frmENSettingsValuesEdit:=nil;
    end;
  finally
    ENSettingsValuesObj.Free;
  end;
end;

procedure TfrmENSettingsEdit.actValueViewExecute(Sender: TObject);
var
  TempENSettingsValues : ENSettingsValuesControllerSoapPort;
begin
  TempENSettingsValues := HTTPRIOENSettingsValues as ENSettingsValuesControllerSoapPort;
  try
     ENSettingsValuesObj := TempENSettingsValues.getObject(StrToInt(sgENSettingsValues.Cells[0,sgENSettingsValues.Row]));
  except
   on EConvertError do Exit;
  end;

  frmENSettingsValuesEdit := TfrmENSettingsValuesEdit.Create(Application, dsView);
  try
    frmENSettingsValuesEdit.ShowModal;
  finally
    frmENSettingsValuesEdit.Free;
    frmENSettingsValuesEdit:=nil;
  end;
end;

procedure TfrmENSettingsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSettings: ENSettingsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtKey, edtComment
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSettings := HTTPRIOENSettings as ENSettingsControllerSoapPort;


     ENSettingsObj.key := edtKey.Text; 

     ENSettingsObj.comment := Trim(edtComment.Text);

    if DialogState = dsInsert then
    begin
      ENSettingsObj.code:=low(Integer);
      TempENSettings.add(ENSettingsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSettings.save(ENSettingsObj);
    end;
  end;
end;


end.