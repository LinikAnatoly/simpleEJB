
unit EditENContractTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENContractTypeController ;

type
  TfrmENContractTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENContractType: THTTPRIO;

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
  frmENContractTypeFilterEdit: TfrmENContractTypeFilterEdit;
  ENContractTypeFilterObj: ENContractTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENContractTypeController  ;
}
{$R *.dfm}



procedure TfrmENContractTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENContractTypeObj.name; 


  end;

}

end;



procedure TfrmENContractTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENContractType: ENContractTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENContractTypeFilterObj.name := edtName.Text; 




  end;
end;




end.