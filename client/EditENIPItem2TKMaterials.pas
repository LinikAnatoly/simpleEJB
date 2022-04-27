unit EditENIPItem2TKMaterials;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENIPItem2TKMaterialsController ;

type
  TfrmENIPItem2TKMaterialsEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;


    HTTPRIOENIPItem2TKMaterials: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    chkIsMaterialForCount: TCheckBox;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENIPItem2TKMaterialsEdit: TfrmENIPItem2TKMaterialsEdit;
  ENIPItem2TKMaterialsObj: ENIPItem2TKMaterials;

implementation



{$R *.dfm}

procedure TfrmENIPItem2TKMaterialsEdit.FormShow(Sender: TObject);
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

    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENIPItem2TKMaterialsObj.code);

    if ( ENIPItem2TKMaterialsObj.isMaterialForCount <> Low(Integer) ) then
       if ENIPItem2TKMaterialsObj.isMaterialForCount > 0
        then chkIsMaterialForCount.Checked:= True
          else
             chkIsMaterialForCount.Checked:= False;

  end;
end;



procedure TfrmENIPItem2TKMaterialsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENIPItem2TKMaterials: ENIPItem2TKMaterialsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([

     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENIPItem2TKMaterials := HTTPRIOENIPItem2TKMaterials as ENIPItem2TKMaterialsControllerSoapPort;



      if chkIsMaterialForCount.Checked then
      ENIPItem2TKMaterialsObj.isMaterialForCount := 1
      else
      ENIPItem2TKMaterialsObj.isMaterialForCount := 0;


    if DialogState = dsInsert then
    begin
      ENIPItem2TKMaterialsObj.code := Low(Integer);
      TempENIPItem2TKMaterials.add(ENIPItem2TKMaterialsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENIPItem2TKMaterials.save(ENIPItem2TKMaterialsObj);
    end;
  end;
end;


end.