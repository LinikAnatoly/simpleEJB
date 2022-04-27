
unit EditENServFromSideStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServFromSideStatusController ;

type
  TfrmENServFromSideStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENServFromSideStatus: THTTPRIO;

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
  frmENServFromSideStatusFilterEdit: TfrmENServFromSideStatusFilterEdit;
  ENServFromSideStatusFilterObj: ENServFromSideStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENServFromSideStatusController  ;
}
{$R *.dfm}



procedure TfrmENServFromSideStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENServFromSideStatusObj.name; 


  end;

}

end;



procedure TfrmENServFromSideStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServFromSideStatus: ENServFromSideStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENServFromSideStatusFilterObj.name := edtName.Text; 




  end;
end;




end.