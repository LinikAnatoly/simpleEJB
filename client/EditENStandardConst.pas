
unit EditENStandardConst;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENStandardConstController,
  TB2Item, TB2Dock, TB2Toolbar, AdvObj ;

type
  TfrmENStandardConstEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENStandardConst: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    gbConstEntry: TGroupBox;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actEntryView: TAction;
    actEntryInsert: TAction;
    actEntryDelete: TAction;
    actEntryEdit: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem4: TTBItem;
    sgENStandardConstEntry: TAdvStringGrid;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    HTTPRIOENStandardConstEntry: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actEntryViewExecute(Sender: TObject);
    procedure actEntryInsertExecute(Sender: TObject);
    procedure actEntryDeleteExecute(Sender: TObject);
    procedure actEntryEditExecute(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENStandardConstEdit: TfrmENStandardConstEdit;
  ENStandardConstObj: ENStandardConst;

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENStandardConstEntryHeaders: array [1..4] of String =
        ( 'Код'
          ,'Значення (коеф.)'
          ,'Початок дії'
          ,'Кінець дії'
        );

implementation


{uses  
    EnergyproController, EnergyproController2, ENStandardConstController  ;
}
{$R *.dfm}


uses ENStandardConstEntryController, EditENStandardConstEntry;


procedure TfrmENStandardConstEdit.FormShow(Sender: TObject);
var
  TempENStandardConstEntry : ENStandardConstEntryControllerSoapPort;
  i : Integer;
  ENStandardConstEntryList : ENStandardConstEntryShortList;
  entryFilter : ENStandardConstEntryFilter;
begin
  DisableControls([edtCode]);
  SetGridHeaders(ENStandardConstEntryHeaders, sgENStandardConstEntry.ColumnHeaders);
  ClearGrid(sgENStandardConstEntry);
  ColCount:=100;
  TempENStandardConstEntry := HTTPRIOENStandardConstEntry as ENStandardConstEntryControllerSoapPort;

  if DialogState = dsView then
  begin
    DisableControls([edtName]);
    DisableActions([actEntryEdit, actEntryInsert, actEntryDelete]);
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([gbConstEntry]);
    lblCode.Top := 115;
    edtCode.Top := 113;
    btnOk.Top := 106;
    btnCancel.Top := 106;
    frmENStandardConstEdit.Width := 475;
    frmENStandardConstEdit.Height := 200;
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtName]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENStandardConstObj.code);
    edtName.Text := ENStandardConstObj.name;

    entryFilter := ENStandardConstEntryFilter.Create;
    SetNullIntProps(entryFilter);
    SetNullXSProps(entryFilter);
    entryFilter.constRef := ENStandardConstRef.Create;
    entryFilter.constRef.code := ENStandardConstObj.code;

    ENStandardConstEntryList := TempENStandardConstEntry.getScrollableFilteredList(ENStandardConstEntryFilter(entryFilter),0,ColCount);

    LastCount:=High(ENStandardConstEntryList.list);

    if LastCount > -1 then
      sgENStandardConstEntry.RowCount:=LastCount+2
    else
      sgENStandardConstEntry.RowCount:=2;

    with sgENStandardConstEntry do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENStandardConstEntryList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENStandardConstEntryList.list[i].code)
        else
          Cells[0,i+1] := '';

        if ENStandardConstEntryList.list[i].constEntry = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENStandardConstEntryList.list[i].constEntry.DecimalString;

        if ENStandardConstEntryList.list[i].startDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENStandardConstEntryList.list[i].startDate);

        if ENStandardConstEntryList.list[i].endDate = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENStandardConstEntryList.list[i].endDate);

        LastRow:=i+1;
        sgENStandardConstEntry.RowCount:=LastRow+1;
      end;
    ColCount:=ColCount+1;
    sgENStandardConstEntry.Row:=1;

  end;

end;



procedure TfrmENStandardConstEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENStandardConst: ENStandardConstControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName])  then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempENStandardConst := HTTPRIOENStandardConst as ENStandardConstControllerSoapPort;

    ENStandardConstObj.name := edtName.Text;

    if DialogState = dsInsert then
    begin
      ENStandardConstObj.code:=low(Integer);
      TempENStandardConst.add(ENStandardConstObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENStandardConst.save(ENStandardConstObj);
    end;
  end;
end;


procedure TfrmENStandardConstEdit.actEntryViewExecute(Sender: TObject);
var
  TempENStandardConstEntry : ENStandardConstEntryControllerSoapPort;
begin
  TempENStandardConstEntry := HTTPRIOENStandardConstEntry as ENStandardConstEntryControllerSoapPort;
  try
     ENStandardConstEntryObj := TempENStandardConstEntry.getObject(StrToInt(sgENStandardConstEntry.Cells[0,sgENStandardConstEntry.Row]));
  except
   on EConvertError do Exit;
  end;

  frmENStandardConstEntryEdit := TfrmENStandardConstEntryEdit.Create(Application, dsView);
  try
    frmENStandardConstEntryEdit.ShowModal;
  finally
    frmENStandardConstEntryEdit.Free;
    frmENStandardConstEntryEdit:=nil;
  end;
end;

procedure TfrmENStandardConstEdit.actEntryInsertExecute(Sender: TObject);
begin
  ENStandardConstEntryObj := ENStandardConstEntry.Create;
  ENStandardConstEntryObj.constRef := ENStandardConstRef.Create;
  ENStandardConstEntryObj.constRef.code := ENStandardConstObj.code;

  try
    frmENStandardConstEntryEdit := TfrmENStandardConstEntryEdit.Create(Application, dsInsert);
    try
      if frmENStandardConstEntryEdit.ShowModal = mrOk then
      begin
        if ENStandardConstEntryObj<>nil then
            FormShow(Sender);
      end;
    finally
      frmENStandardConstEntryEdit.Free;
      frmENStandardConstEntryEdit:=nil;
    end;
  finally
    ENStandardConstEntryObj.Free;
  end;
end;

procedure TfrmENStandardConstEdit.actEntryDeleteExecute(Sender: TObject);
var
  TempENStandardConstEntry : ENStandardConstEntryControllerSoapPort;
  ObjCode : Integer;
begin

  TempENStandardConstEntry := HTTPRIOENStandardConstEntry as ENStandardConstEntryControllerSoapPort;
  try
    ObjCode := StrToInt(sgENStandardConstEntry.Cells[0,sgENStandardConstEntry.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити значення для цієї величини?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENStandardConstEntry.remove(ObjCode);
  end;
  
  FormShow(Sender);
end;

procedure TfrmENStandardConstEdit.actEntryEditExecute(Sender: TObject);
var
  TempENStandardConstEntry : ENStandardConstEntryControllerSoapPort;
begin
  TempENStandardConstEntry := HTTPRIOENStandardConstEntry as ENStandardConstEntryControllerSoapPort;
  try
    ENStandardConstEntryObj := TempENStandardConstEntry.getObject(StrToInt(sgENStandardConstEntry.Cells[0,sgENStandardConstEntry.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENStandardConstEntryEdit := TfrmENStandardConstEntryEdit.Create(Application, dsEdit);
  try
    if frmENStandardConstEntryEdit.ShowModal= mrOk then
      begin
        FormShow(Sender);
      end;
  finally
    frmENStandardConstEntryEdit.Free;
    frmENStandardConstEntryEdit:=nil;
  end;
end;

end.