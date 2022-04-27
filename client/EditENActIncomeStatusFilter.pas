
unit EditENActIncomeStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActIncomeStatusController ;

type
  TfrmENActIncomeStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENActIncomeStatus: THTTPRIO;

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
  frmENActIncomeStatusFilterEdit: TfrmENActIncomeStatusFilterEdit;
  ENActIncomeStatusFilterObj: ENActIncomeStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActIncomeStatusController  ;
}
{$R *.dfm}



procedure TfrmENActIncomeStatusFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENActIncomeStatusObj.name; 


  end;

}

end;



procedure TfrmENActIncomeStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActIncomeStatus: ENActIncomeStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENActIncomeStatusFilterObj.name := edtName.Text; 




  end;
end;




end.