
unit EditENNomenclaturesOperativeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENNomenclaturesOperativeController ;

type
  TfrmENNomenclaturesOperativeFilterEdit = class(TDialogForm)


  HTTPRIOENNomenclaturesOperative: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblId: TLabel;
    edtId: TEdit;
    lblNn: TLabel;
    edtNn: TEdit;
    lblBal_sch: TLabel;
    edtBal_sch: TEdit;
    lblName: TLabel;
    edtName: TEdit;
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENNomenclaturesOperativeFilterEdit: TfrmENNomenclaturesOperativeFilterEdit;
  ENNomenclaturesOperativeFilterObj: ENNomenclaturesOperativeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENNomenclaturesOperativeController  ;
}
{$R *.dfm}

procedure TfrmENNomenclaturesOperativeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENNomenclaturesOperative: ENNomenclaturesOperativeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin
    if ( edtId.Text <> '' ) then
      ENNomenclaturesOperativeFilterObj.id := StrToInt(edtId.Text)
    else
      ENNomenclaturesOperativeFilterObj.id := Low(Integer);

    ENNomenclaturesOperativeFilterObj.nn := edtNn.Text;
    ENNomenclaturesOperativeFilterObj.bal_sch := edtBal_sch.Text;
    ENNomenclaturesOperativeFilterObj.name := edtName.Text;
  end;
end;

end.