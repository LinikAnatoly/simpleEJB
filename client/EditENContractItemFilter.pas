
unit EditENContractItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENContractItemController ;

type
  TfrmENContractItemFilterEdit = class(TDialogForm)

    lblCountGen : TLabel;
    edtCountGen: TEdit;

    lblPrice : TLabel;
    edtPrice: TEdit;

    lblCost : TLabel;
    edtCost: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblTKMaterialsMaterialName : TLabel;
  edtTKMaterialsMaterialName : TEdit;
  spbTKMaterialsMaterial : TSpeedButton;
  
  lblENContractContractName : TLabel;
  edtENContractContractName : TEdit;
  spbENContractContract : TSpeedButton;
  

  HTTPRIOENContractItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKMaterialsMaterialClick(Sender : TObject);
  procedure spbENContractContractClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENContractItemFilterEdit: TfrmENContractItemFilterEdit;
  ENContractItemFilterObj: ENContractItemFilter;

implementation

uses
  ShowTKMaterials
  ,TKMaterialsController
  ,ShowENContract
  ,ENContractController
;

{uses  
    EnergyproController, EnergyproController2, ENContractItemController  ;
}
{$R *.dfm}



procedure TfrmENContractItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtPrice
      ,edtCost
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENContractItemObj.countGen <> nil ) then
       edtCountGen.Text := ENContractItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    if ( ENContractItemObj.price <> nil ) then
       edtPrice.Text := ENContractItemObj.price.decimalString
    else
       edtPrice.Text := ''; 



    if ( ENContractItemObj.cost <> nil ) then
       edtCost.Text := ENContractItemObj.cost.decimalString
    else
       edtCost.Text := ''; 



    edtCommentGen.Text := ENContractItemObj.commentGen; 



    edtUserGen.Text := ENContractItemObj.userGen; 



      if ENContractItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENContractItemObj.dateEdit.Year,ENContractItemObj.dateEdit.Month,ENContractItemObj.dateEdit.Day);
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



procedure TfrmENContractItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENContractItem: ENContractItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENContractItemFilterObj.countGen = nil ) then
       ENContractItemFilterObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENContractItemFilterObj.countGen.decimalString := edtCountGen.Text 
     else
       ENContractItemFilterObj.countGen := nil;




     if (ENContractItemFilterObj.price = nil ) then
       ENContractItemFilterObj.price := TXSDecimal.Create;
     if edtPrice.Text <> '' then
       ENContractItemFilterObj.price.decimalString := edtPrice.Text 
     else
       ENContractItemFilterObj.price := nil;




     if (ENContractItemFilterObj.cost = nil ) then
       ENContractItemFilterObj.cost := TXSDecimal.Create;
     if edtCost.Text <> '' then
       ENContractItemFilterObj.cost.decimalString := edtCost.Text 
     else
       ENContractItemFilterObj.cost := nil;




     ENContractItemFilterObj.commentGen := edtCommentGen.Text; 



     ENContractItemFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENContractItemFilterObj.dateEdit = nil then
          ENContractItemFilterObj.dateEdit := TXSDate.Create;
       ENContractItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENContractItemFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENContractItemFilterEdit.spbTKMaterialsMaterialClick(Sender : TObject);
var 
   frmTKMaterialsShow: TfrmTKMaterialsShow;
begin
   frmTKMaterialsShow:=TfrmTKMaterialsShow.Create(Application,fmNormal);
   try
      with frmTKMaterialsShow do
        if ShowModal = mrOk then
        begin
            try
               if ENContractItemFilterObj.material = nil then ENContractItemFilterObj.material := TKMaterials.Create();
               //ENContractItemFilterObj.material.code := StrToInt(GetReturnValue(sgTKMaterials,0));
               edtTKMaterialsMaterialName.Text:= TKMaterialsShort(tvDep.Selected.Data).name; // GetReturnValue(sgTKMaterials,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMaterialsShow.Free;
   end;
end;


procedure TfrmENContractItemFilterEdit.spbENContractContractClick(Sender : TObject);
var 
   frmENContractShow: TfrmENContractShow;
begin
   frmENContractShow:=TfrmENContractShow.Create(Application,fmNormal);
   try
      with frmENContractShow do
        if ShowModal = mrOk then
        begin
            try
               if ENContractItemFilterObj.contract = nil then ENContractItemFilterObj.contract := ENContract.Create();
               ENContractItemFilterObj.contract.code := StrToInt(GetReturnValue(sgENContract,0));
               edtENContractContractName.Text:=GetReturnValue(sgENContract,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENContractShow.Free;
   end;
end;





end.