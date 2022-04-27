
unit EditENIPImplementationTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENIPImplementationTypeController ;

type
  TfrmENIPImplementationTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENIPImplementationType: THTTPRIO;

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
  frmENIPImplementationTypeFilterEdit: TfrmENIPImplementationTypeFilterEdit;
  ENIPImplementationTypeFilterObj: ENIPImplementationTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENIPImplementationTypeController  ;
}
{$R *.dfm}



procedure TfrmENIPImplementationTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENIPImplementationTypeObj.name; 


  end;

}

end;



procedure TfrmENIPImplementationTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENIPImplementationType: ENIPImplementationTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENIPImplementationTypeFilterObj.name := edtName.Text; 




  end;
end;




end.