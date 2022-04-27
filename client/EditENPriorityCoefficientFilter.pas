
unit EditENPriorityCoefficientFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENPriorityCoefficientController ;

type
    TfrmENPriorityCoefficientFilterEdit = class(TDialogForm)

    lblValue6 : TLabel;
    edtValue6: TEdit;
    lblValue35 : TLabel;
    edtValue35: TEdit;
    lblValue150 : TLabel;
    edtValue150: TEdit;


    HTTPRIOENPriorityCoefficient: THTTPRIO;

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
  frmENPriorityCoefficientFilterEdit: TfrmENPriorityCoefficientFilterEdit;
  ENPriorityCoefficientFilterObj: ENPriorityCoefficientFilter;

implementation



{$R *.dfm}



procedure TfrmENPriorityCoefficientFilterEdit.FormShow(Sender: TObject);
begin
  SetFloatStyle([edtValue6, edtValue35, edtValue150]);
end;



procedure TfrmENPriorityCoefficientFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENPriorityCoefficient: ENPriorityCoefficientControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin
     if (ENPriorityCoefficientFilterObj.value6 = nil ) then
       ENPriorityCoefficientFilterObj.value6 := TXSDecimal.Create;
     if edtValue6.Text <> '' then
       ENPriorityCoefficientFilterObj.value6.decimalString := edtValue6.Text
     else
       ENPriorityCoefficientFilterObj.value6 := nil;

     if (ENPriorityCoefficientFilterObj.value35 = nil ) then
       ENPriorityCoefficientFilterObj.value35 := TXSDecimal.Create;
     if edtValue35.Text <> '' then
       ENPriorityCoefficientFilterObj.value35.decimalString := edtValue35.Text
     else
       ENPriorityCoefficientFilterObj.value35 := nil;

     if (ENPriorityCoefficientFilterObj.value150 = nil ) then
       ENPriorityCoefficientFilterObj.value150 := TXSDecimal.Create;
     if edtValue150.Text <> '' then
       ENPriorityCoefficientFilterObj.value150.decimalString := edtValue150.Text
     else
       ENPriorityCoefficientFilterObj.value150 := nil;

  end;
end;




end.