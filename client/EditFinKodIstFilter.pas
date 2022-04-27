
unit EditFinKodIstFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FinKodIstController ;

type
  TfrmFinKodIstFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOFinKodIst: THTTPRIO;

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
  frmFinKodIstFilterEdit: TfrmFinKodIstFilterEdit;
  FinKodIstFilterObj: FinKodIstFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, FinKodIstController  ;
}
{$R *.dfm}



procedure TfrmFinKodIstFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := FinKodIstObj.name; 


  end;

}

end;



procedure TfrmFinKodIstFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempFinKodIst: FinKodIstControllerSoapPort; //»сключено объ€вление не используемых переменных
begin
  if (ModalResult = mrOk)  then
  begin

     FinKodIstFilterObj.name := edtName.Text; 




  end;
end;




end.