
unit EditENIPFinancingFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENIPFinancingController ;

type
  TfrmENIPFinancingFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENIPFinancing: THTTPRIO;

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
  frmENIPFinancingFilterEdit: TfrmENIPFinancingFilterEdit;
  ENIPFinancingFilterObj: ENIPFinancingFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENIPFinancingController  ;
}
{$R *.dfm}



procedure TfrmENIPFinancingFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENIPFinancingObj.name; 


  end;

}

end;



procedure TfrmENIPFinancingFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENIPFinancing: ENIPFinancingControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENIPFinancingFilterObj.name := edtName.Text; 




  end;
end;




end.