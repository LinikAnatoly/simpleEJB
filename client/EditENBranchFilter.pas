
unit EditENBranchFilter;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENBranchController ;

type
  TfrmENBranchFilterEdit = class(TDialogForm)
    lblName : TLabel;
    edtName: TEdit;
    lblBasicConsumer : TLabel;
    edtBasicConsumer: TEdit;
    lblNumberGen : TLabel;
    edtNumberGen: TEdit;
    lblENElement: TLabel;
    edtENElement: TEdit;
    spbENElement: TSpeedButton;
    HTTPRIOENBranch: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    edtCurrentAdmis: TEdit;
    lblCurrentAdmis: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENElementClick(Sender : TObject);
  private
    { Private declarations }
  public
    { Public declarations }
end;

var frmENBranchFilterEdit: TfrmENBranchFilterEdit;
  ENBranchFilterObj: ENBranchFilter;

implementation

uses ShowENElement, ENElementController;

{$R *.dfm}

procedure TfrmENBranchFilterEdit.FormShow(Sender: TObject);
begin
{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([edtName, edtBasicConsumer, edtNumberGen]);
  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtName.Text := ENBranchObj.name;
      edtBasicConsumer.Text := ENBranchObj.basicConsumer;
      edtNumberGen.Text := ENBranchObj.numberGen;
      if ( ENBranchObj.currentAdmis <> nil ) then
        edtCurrentAdmis.Text := ENBranchObj.currentAdmis.decimalString
      else
        edtCurrentAdmis.Text := '';
    end;}
end;



procedure TfrmENBranchFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBranch: ENBranchControllerSoapPort;
begin
  if ModalResult = mrOk then
    begin
      ENBranchFilterObj.name := edtName.Text;
      ENBranchFilterObj.basicConsumer := edtBasicConsumer.Text;
      ENBranchFilterObj.numberGen := edtNumberGen.Text;
      if (ENBranchFilterObj.currentAdmis = nil ) then
        ENBranchFilterObj.currentAdmis := TXSDecimal.Create;
      if edtCurrentAdmis.Text <> '' then
        ENBranchFilterObj.currentAdmis.decimalString := edtCurrentAdmis.Text
      else
        ENBranchFilterObj.currentAdmis := nil;
    end;
end;

procedure TfrmENBranchFilterEdit.spbENElementClick(Sender : TObject);
//var frmENElementShow: TfrmENElementShow;
begin
  (*frmENElementShow := TfrmENElementShow.Create(Application, fmNormal);
  try
    with frmENElementShow do
      if ShowModal = mrOk then
      begin
          try
             if ENBranchFilterObj.element = nil then
               ENBranchFilterObj.element := ENElement.Create();
             ENBranchFilterObj.element.code :=
               StrToInt(GetReturnValue(sgENElement,0));
             edtENElement.Text := GetReturnValue(sgENElement, 1);
          except
             on EConvertError do Exit;
          end;
      end;
  finally
    frmENElementShow.Free;
  end;*)
end;

end.
