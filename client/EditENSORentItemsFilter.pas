
unit EditENSORentItemsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSORentItemsController ;

type
  TfrmENSORentItemsFilterEdit = class(TDialogForm)

    lblLocalityName : TLabel;
    edtLocalityName: TEdit;

    lblPylonNumbers : TLabel;
    edtPylonNumbers: TMemo;

    lblJointLineLenght : TLabel;
    edtJointLineLenght: TEdit;

    lblPylonQuantity : TLabel;
    edtPylonQuantity: TEdit;

    lblLinePurpose : TLabel;
    edtLinePurpose: TMemo;

    lblJointLineCableMark : TLabel;
    edtJointLineCableMark: TMemo;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENSORentItems: THTTPRIO;

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
  frmENSORentItemsFilterEdit: TfrmENSORentItemsFilterEdit;
  ENSORentItemsFilterObj: ENSORentItemsFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSORentItemsController  ;
}
{$R *.dfm}



procedure TfrmENSORentItemsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtLocalityName
      ,edtPylonNumbers
      ,edtPylonQuantity
      ,edtLinePurpose
      ,edtJointLineCableMark
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtLocalityName.Text := ENSORentItemsObj.localityName; 



    MakeMultiline(edtPylonNumbers.Lines, ENSORentItemsObj.pylonNumbers);



    if ( ENSORentItemsObj.jointLineLenght <> nil ) then
       edtJointLineLenght.Text := ENSORentItemsObj.jointLineLenght.decimalString
    else
       edtJointLineLenght.Text := ''; 



    if ( ENSORentItemsObj.pylonQuantity <> Low(Integer) ) then
       edtPylonQuantity.Text := IntToStr(ENSORentItemsObj.pylonQuantity)
    else
       edtPylonQuantity.Text := '';



    MakeMultiline(edtLinePurpose.Lines, ENSORentItemsObj.linePurpose);



    MakeMultiline(edtJointLineCableMark.Lines, ENSORentItemsObj.jointLineCableMark);



    edtUserGen.Text := ENSORentItemsObj.userGen; 



      if ENSORentItemsObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSORentItemsObj.dateEdit.Year,ENSORentItemsObj.dateEdit.Month,ENSORentItemsObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  


  end;

}

end;



procedure TfrmENSORentItemsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENSORentItems: ENSORentItemsControllerSoapPort; //»сключено объ€вление не используемых переменных
begin
  if (ModalResult = mrOk)  then
  begin

     ENSORentItemsFilterObj.localityName := edtLocalityName.Text; 




     ENSORentItemsFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSORentItemsFilterObj.dateEdit = nil then
          ENSORentItemsFilterObj.dateEdit := TXSDateTime.Create;
       ENSORentItemsFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSORentItemsFilterObj.dateEdit := nil;




  end;
end;




end.