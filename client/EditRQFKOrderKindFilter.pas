
unit EditRQFKOrderKindFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKOrderKindController ;

type
  TfrmRQFKOrderKindFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblTxtGen : TLabel;
    edtTxtGen: TEdit;



  HTTPRIORQFKOrderKind: THTTPRIO;

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
  frmRQFKOrderKindFilterEdit: TfrmRQFKOrderKindFilterEdit;
  RQFKOrderKindFilterObj: RQFKOrderKindFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQFKOrderKindController  ;
}
{$R *.dfm}



procedure TfrmRQFKOrderKindFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtTxtGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := RQFKOrderKindObj.name; 



    edtTxtGen.Text := RQFKOrderKindObj.txtGen; 


  end;

}

end;



procedure TfrmRQFKOrderKindFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrderKind: RQFKOrderKindControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQFKOrderKindFilterObj.name := edtName.Text; 



     RQFKOrderKindFilterObj.txtGen := edtTxtGen.Text; 




  end;
end;




end.