
unit EditENPayment2SOTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPayment2SOTypeController ;

type
  TfrmENPayment2SOTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENPayment2SOType: THTTPRIO;

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
  frmENPayment2SOTypeFilterEdit: TfrmENPayment2SOTypeFilterEdit;
  ENPayment2SOTypeFilterObj: ENPayment2SOTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPayment2SOTypeController  ;
}
{$R *.dfm}



procedure TfrmENPayment2SOTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENPayment2SOTypeObj.name; 


  end;

}

end;



procedure TfrmENPayment2SOTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPayment2SOType: ENPayment2SOTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPayment2SOTypeFilterObj.name := edtName.Text; 




  end;
end;




end.