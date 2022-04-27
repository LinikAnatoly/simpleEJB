
unit EditRQSpravDKPPFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQSpravDKPPController ;

type
  TfrmRQSpravDKPPFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TMemo;



  HTTPRIORQSpravDKPP: THTTPRIO;

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
  frmRQSpravDKPPFilterEdit: TfrmRQSpravDKPPFilterEdit;
  RQSpravDKPPFilterObj: RQSpravDKPPFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQSpravDKPPController  ;
}
{$R *.dfm}



procedure TfrmRQSpravDKPPFilterEdit.FormShow(Sender: TObject);

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

    MakeMultiline(edtName.Lines, RQSpravDKPPObj.name);


  end;

}

end;



procedure TfrmRQSpravDKPPFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQSpravDKPP: RQSpravDKPPControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQSpravDKPPFilterObj.name := edtName.Text; 




  end;
end;




end.