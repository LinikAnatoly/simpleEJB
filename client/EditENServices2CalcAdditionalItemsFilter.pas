
unit EditENServices2CalcAdditionalItemsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServices2CalcAdditionalItemsController ;

type
  TfrmENServices2CalcAdditionalItemsFilterEdit = class(TDialogForm)

    lblSumma : TLabel;
    edtSumma: TEdit;

    lblCountgen : TLabel;
    edtCountgen: TEdit;

    lblComment : TLabel;
    edtComment: TEdit;



  HTTPRIOENServices2CalcAdditionalItems: THTTPRIO;

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
  frmENServices2CalcAdditionalItemsFilterEdit: TfrmENServices2CalcAdditionalItemsFilterEdit;
  ENServices2CalcAdditionalItemsFilterObj: ENServices2CalcAdditionalItemsFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENServices2CalcAdditionalItemsController  ;
}
{$R *.dfm}



procedure TfrmENServices2CalcAdditionalItemsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENServices2CalcAdditionalItemsObj.summa <> nil ) then
       edtSumma.Text := ENServices2CalcAdditionalItemsObj.summa.decimalString
    else
       edtSumma.Text := ''; 



    if ( ENServices2CalcAdditionalItemsObj.countgen <> nil ) then
       edtCountgen.Text := ENServices2CalcAdditionalItemsObj.countgen.decimalString
    else
       edtCountgen.Text := ''; 



    edtComment.Text := ENServices2CalcAdditionalItemsObj.comment; 


  end;

}

end;



procedure TfrmENServices2CalcAdditionalItemsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENServices2CalcAdditionalItems: ENServices2CalcAdditionalItemsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENServices2CalcAdditionalItemsFilterObj.summa = nil ) then
       ENServices2CalcAdditionalItemsFilterObj.summa := TXSDecimal.Create;
     if edtSumma.Text <> '' then
       ENServices2CalcAdditionalItemsFilterObj.summa.decimalString := edtSumma.Text 
     else
       ENServices2CalcAdditionalItemsFilterObj.summa := nil;




     if (ENServices2CalcAdditionalItemsFilterObj.countgen = nil ) then
       ENServices2CalcAdditionalItemsFilterObj.countgen := TXSDecimal.Create;
     if edtCountgen.Text <> '' then
       ENServices2CalcAdditionalItemsFilterObj.countgen.decimalString := edtCountgen.Text 
     else
       ENServices2CalcAdditionalItemsFilterObj.countgen := nil;




     ENServices2CalcAdditionalItemsFilterObj.comment := edtComment.Text; 




  end;
end;




end.