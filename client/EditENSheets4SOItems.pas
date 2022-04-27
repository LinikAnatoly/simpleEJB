unit EditENSheets4SOItems;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSheets4SOController ;

type
  TfrmENSheets4SOItemsEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblContentValue : TLabel;
    edtContentValue: TMemo;
    lblAdditionalContent : TLabel;
    edtAdditionalContent: TMemo;


    HTTPRIOENSheets4SOItems: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    btnENSheet4SOItemTemplate: TSpeedButton;
    edtENSheet4SOItemTemplate: TEdit;
    lblItemTemplate: TLabel;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnENSheet4SOItemTemplateClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
    isNotController : Boolean;
  end;

var
  frmENSheets4SOItemsEdit: TfrmENSheets4SOItemsEdit;
  ENSheets4SOItemsObj: ENSheets4SOItems;

implementation

uses ShowENSheets4SOItemsTemplate, ENSheets4SOItemsTemplateController;



{$R *.dfm}

procedure TfrmENSheets4SOItemsEdit.FormShow(Sender: TObject);
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
      edtContentValue
      ,edtENSheet4SOItemTemplate
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENSheets4SOItemsObj.code);
    MakeMultiline(edtContentValue.Lines, ENSheets4SOItemsObj.contentValue);
    MakeMultiline(edtAdditionalContent.Lines, ENSheets4SOItemsObj.additionalContent);

  end;
end;



procedure TfrmENSheets4SOItemsEdit.btnENSheet4SOItemTemplateClick(
  Sender: TObject);
var
   frmENSheets4SOItemsTemplateShow : TfrmENSheets4SOItemsTemplateShow;
begin
   frmENSheets4SOItemsTemplateShow := TfrmENSheets4SOItemsTemplateShow.Create(Application,fmNormal);
   try
      with frmENSheets4SOItemsTemplateShow do begin

        if ShowModal = mrOk then
        begin
          try

             edtENSheet4SOItemTemplate.Text := GetReturnValue(sgENSheets4SOItemsTemplate,1);
             ENSheets4SOItemsObj.sheetItemTemplateRef := ENSheets4SOItemsTemplateRef.Create;
             ENSheets4SOItemsObj.sheetItemTemplateRef.code := StrToInt(GetReturnValue(sgENSheets4SOItemsTemplate,0));
             edtContentValue.Text := GetReturnValue(sgENSheets4SOItemsTemplate,2);

          except
             on EConvertError do Exit;
          end;
        end;
      end;
   finally
      frmENSheets4SOItemsTemplateShow.Free;
   end;
end;

procedure TfrmENSheets4SOItemsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSheets4SOItems: ENSheets4SOItemsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtContentValue
      ,edtENSheet4SOItemTemplate
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENSheets4SOItems := HTTPRIOENSheets4SOItems as ENSheets4SOItemsControllerSoapPort;

    ENSheets4SOItemsObj.contentValue := edtContentValue.Text; 
    ENSheets4SOItemsObj.additionalContent := edtAdditionalContent.Text; 

    if (DialogState = dsInsert) and (not isNotController) then
    begin
      ENSheets4SOItemsObj.code := Low(Integer);
      TempENSheets4SOItems.add(ENSheets4SOItemsObj);
    end
    else
    if (DialogState = dsEdit) and (not isNotController) then
    begin
      TempENSheets4SOItems.save(ENSheets4SOItemsObj);
    end;
  end;
end;


end.