
unit EditENDestinationOrderFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDestinationOrderController ;

type
  TfrmENDestinationOrderFilterEdit = class(TDialogForm)

    lblNumberInOrder : TLabel;
    edtNumberInOrder: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;



  HTTPRIOENDestinationOrder: THTTPRIO;

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
  frmENDestinationOrderFilterEdit: TfrmENDestinationOrderFilterEdit;
  ENDestinationOrderFilterObj: ENDestinationOrderFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDestinationOrderController  ;
}
{$R *.dfm}



procedure TfrmENDestinationOrderFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberInOrder
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENDestinationOrderObj.numberInOrder <> Low(Integer) ) then
       edtNumberInOrder.Text := IntToStr(ENDestinationOrderObj.numberInOrder)
    else
       edtNumberInOrder.Text := '';



    MakeMultiline(edtCommentGen.Lines, ENDestinationOrderObj.commentGen);


  end;

}

end;



procedure TfrmENDestinationOrderFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDestinationOrder: ENDestinationOrderControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtNumberInOrder.Text <> '' ) then
       ENDestinationOrderFilterObj.numberInOrder := StrToInt(edtNumberInOrder.Text)
     else
       ENDestinationOrderFilterObj.numberInOrder := Low(Integer) ;




     ENDestinationOrderFilterObj.commentGen := edtCommentGen.Text; 




  end;
end;




end.