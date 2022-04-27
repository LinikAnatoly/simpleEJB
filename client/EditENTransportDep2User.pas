unit EditENTransportDep2User;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENTransportDep2UserController ;

type
  TfrmENTransportDep2UserEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblUserCode : TLabel;
    edtUserCode: TEdit;

  lblENTransportDepartmentTransportDepartmentName : TLabel;
  edtENTransportDepartmentTransportDepartmentName : TEdit;
  spbENTransportDepartmentTransportDepartment : TSpeedButton;
  

    HTTPRIOENTransportDep2User: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENTransportDepartmentTransportDepartmentClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENTransportDep2UserEdit: TfrmENTransportDep2UserEdit;
  ENTransportDep2UserObj: ENTransportDep2User;

implementation

uses
  ShowENTransportDepartment
  ,ENTransportDepartmentController
;


{$R *.dfm}

procedure TfrmENTransportDep2UserEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENTransportDepartmentTransportDepartmentName
      ,spbENTransportDepartmentTransportDepartment
       ]);
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([
      edtUserCode
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENTransportDep2UserObj.code);
    if ( ENTransportDep2UserObj.userCode <> Low(Integer) ) then
       edtUserCode.Text := IntToStr(ENTransportDep2UserObj.userCode)
    else
       edtUserCode.Text := '';

    edtENTransportDepartmentTransportDepartmentName.Text := ENTransportDep2UserObj.transportDepartment.name;
  end;
end;



procedure TfrmENTransportDep2UserEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportDep2User: ENTransportDep2UserControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtUserCode
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENTransportDep2User := HTTPRIOENTransportDep2User as ENTransportDep2UserControllerSoapPort;

    if ( edtUserCode.Text <> '' ) then
      ENTransportDep2UserObj.userCode := StrToInt(edtUserCode.Text)
    else
      ENTransportDep2UserObj.userCode := Low(Integer);

    if DialogState = dsInsert then
    begin
      ENTransportDep2UserObj.code := Low(Integer);
      TempENTransportDep2User.add(ENTransportDep2UserObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTransportDep2User.save(ENTransportDep2UserObj);
    end;
  end;
end;


procedure TfrmENTransportDep2UserEdit.spbENTransportDepartmentTransportDepartmentClick(Sender : TObject);
var 
   frmENTransportDepartmentShow: TfrmENTransportDepartmentShow;
begin
   frmENTransportDepartmentShow:=TfrmENTransportDepartmentShow.Create(Application,fmNormal);
   try
      with frmENTransportDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransportDep2UserObj.transportDepartment = nil then ENTransportDep2UserObj.transportDepartment := ENTransportDepartment.Create();
               ENTransportDep2UserObj.transportDepartment.code := StrToInt(GetReturnValue(sgENTransportDepartment,0));
               edtENTransportDepartmentTransportDepartmentName.Text:=GetReturnValue(sgENTransportDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENTransportDepartmentShow.Free;
   end;
end;


end.