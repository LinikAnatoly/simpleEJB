unit EditENPlanXqtnHistory;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENPlanXqtnHistoryController ;

type
  TfrmENPlanXqtnHistoryEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblExecutionPercent : TLabel;
    edtExecutionPercent: TEdit;


    HTTPRIOENPlanXqtnHistory: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENPlanXqtnHistoryEdit: TfrmENPlanXqtnHistoryEdit;
  ENPlanXqtnHistoryObj: ENPlanXqtnHistory;

implementation



{$R *.dfm}

procedure TfrmENPlanXqtnHistoryEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([
      edtDateGen
      ,edtExecutionPercent
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENPlanXqtnHistoryObj.code);
    SetDateFieldForDateTimePicker(edtDateGen, ENPlanXqtnHistoryObj.dateGen);
    if ( ENPlanXqtnHistoryObj.executionPercent <> Low(Integer) ) then
       edtExecutionPercent.Text := IntToStr(ENPlanXqtnHistoryObj.executionPercent)
    else
       edtExecutionPercent.Text := '';

  end;
end;



procedure TfrmENPlanXqtnHistoryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanXqtnHistory: ENPlanXqtnHistoryControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtExecutionPercent
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENPlanXqtnHistory := HTTPRIOENPlanXqtnHistory as ENPlanXqtnHistoryControllerSoapPort;

    ENPlanXqtnHistoryObj.dateGen := GetTXSDateFromTDateTimePicker(edtDateGen);
    if ( edtExecutionPercent.Text <> '' ) then
      ENPlanXqtnHistoryObj.executionPercent := StrToInt(edtExecutionPercent.Text)
    else
      ENPlanXqtnHistoryObj.executionPercent := Low(Integer);

    if DialogState = dsInsert then
    begin
      ENPlanXqtnHistoryObj.code := Low(Integer);
      TempENPlanXqtnHistory.add(ENPlanXqtnHistoryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPlanXqtnHistory.save(ENPlanXqtnHistoryObj);
    end;
  end;
end;


end.