unit EditENSheets4SOItemsTemplate;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSheets4SOItemsTemplateController ;

type
  TfrmENSheets4SOItemsTemplateEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TMemo;
    lblTemplateValue : TLabel;
    edtTemplateValue: TMemo;


    HTTPRIOENSheets4SOItemsTemplate: THTTPRIO;

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
  frmENSheets4SOItemsTemplateEdit: TfrmENSheets4SOItemsTemplateEdit;
  ENSheets4SOItemsTemplateObj: ENSheets4SOItemsTemplate;

implementation



{$R *.dfm}

procedure TfrmENSheets4SOItemsTemplateEdit.FormShow(Sender: TObject);
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
      edtName
      ,edtTemplateValue
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENSheets4SOItemsTemplateObj.code);
    MakeMultiline(edtName.Lines, ENSheets4SOItemsTemplateObj.name);
    MakeMultiline(edtTemplateValue.Lines, ENSheets4SOItemsTemplateObj.templateValue);

  end;
end;



procedure TfrmENSheets4SOItemsTemplateEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSheets4SOItemsTemplate: ENSheets4SOItemsTemplateControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtTemplateValue
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENSheets4SOItemsTemplate := HTTPRIOENSheets4SOItemsTemplate as ENSheets4SOItemsTemplateControllerSoapPort;

    ENSheets4SOItemsTemplateObj.name := edtName.Text; 
    ENSheets4SOItemsTemplateObj.templateValue := edtTemplateValue.Text; 

    if DialogState = dsInsert then
    begin
      ENSheets4SOItemsTemplateObj.code := Low(Integer);
      TempENSheets4SOItemsTemplate.add(ENSheets4SOItemsTemplateObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSheets4SOItemsTemplate.save(ENSheets4SOItemsTemplateObj);
    end;
  end;
end;


end.