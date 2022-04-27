
unit EditENContragentFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENContragentController ;

type
  TfrmENContragentFilterEdit = class(TDialogForm)

    lblContragentName : TLabel;
    edtContragentName: TEdit;

    lblContragentAddress : TLabel;
    edtContragentAddress: TMemo;

    lblContragentAddressWork : TLabel;
    edtContragentAddressWork: TMemo;

    lblContragentPosition : TLabel;
    edtContragentPosition: TMemo;

    lblContragentOkpo : TLabel;
    edtContragentOkpo: TEdit;

    lblContragentBankAccount : TLabel;
    edtContragentBankAccount: TEdit;

    lblContragentBankName : TLabel;
    edtContragentBankName: TEdit;

    lblContragentBankMfo : TLabel;
    edtContragentBankMfo: TEdit;

    lblContragentBossName : TLabel;
    edtContragentBossName: TEdit;

    lblContragentPassport : TLabel;
    edtContragentPassport: TMemo;

    lblWarrantDate : TLabel;
    edtWarrantDate: TDateTimePicker;
    lblWarrantNumber : TLabel;
    edtWarrantNumber: TEdit;

    lblWarrantFIO : TLabel;
    edtWarrantFIO: TEdit;

    lblWarrantPassport : TLabel;
    edtWarrantPassport: TMemo;

    lblWarrantAddress : TLabel;
    edtWarrantAddress: TMemo;


  lblENTechConditionsObjectsTechConObjectsName : TLabel;
  edtENTechConditionsObjectsTechConObjectsName : TEdit;
  spbENTechConditionsObjectsTechConObjects : TSpeedButton;
  
  lblENBasisTypeBasisTypeName : TLabel;
  edtENBasisTypeBasisTypeName : TEdit;
  spbENBasisTypeBasisType : TSpeedButton;
  

  HTTPRIOENContragent: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENTechConditionsObjectsTechConObjectsClick(Sender : TObject);
  procedure spbENBasisTypeBasisTypeClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENContragentFilterEdit: TfrmENContragentFilterEdit;
  ENContragentFilterObj: ENContragentFilter;

implementation

uses
  ShowENTechConditionsObjects
  ,ENTechConditionsObjectsController
//  ,ShowENBasisType
  ,ENBasisTypeController
;

{uses  
    EnergyproController, EnergyproController2, ENContragentController  ;
}
{$R *.dfm}



procedure TfrmENContragentFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtContragentName.Text := ENContragentObj.contragentName; 



    MakeMultiline(edtContragentAddress.Lines, ENContragentObj.contragentAddress);



    MakeMultiline(edtContragentAddressWork.Lines, ENContragentObj.contragentAddressWork);



    MakeMultiline(edtContragentPosition.Lines, ENContragentObj.contragentPosition);



    edtContragentOkpo.Text := ENContragentObj.contragentOkpo; 



    edtContragentBankAccount.Text := ENContragentObj.contragentBankAccount; 



    edtContragentBankName.Text := ENContragentObj.contragentBankName; 



    edtContragentBankMfo.Text := ENContragentObj.contragentBankMfo; 



    edtContragentBossName.Text := ENContragentObj.contragentBossName; 



    MakeMultiline(edtContragentPassport.Lines, ENContragentObj.contragentPassport);



      if ENContragentObj.warrantDate <> nil then
      begin
        edtWarrantDate.DateTime:=EncodeDate(ENContragentObj.warrantDate.Year,ENContragentObj.warrantDate.Month,ENContragentObj.warrantDate.Day);
        edtWarrantDate.checked := true;
      end
      else
      begin
        edtWarrantDate.DateTime:=SysUtils.Date;
        edtWarrantDate.checked := false;
      end;



    edtWarrantNumber.Text := ENContragentObj.warrantNumber; 



    edtWarrantFIO.Text := ENContragentObj.warrantFIO; 



    MakeMultiline(edtWarrantPassport.Lines, ENContragentObj.warrantPassport);



    MakeMultiline(edtWarrantAddress.Lines, ENContragentObj.warrantAddress);


  end;

}

end;



procedure TfrmENContragentFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENContragent: ENContragentControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENContragentFilterObj.contragentName := edtContragentName.Text; 



     ENContragentFilterObj.contragentAddress := edtContragentAddress.Text; 



     ENContragentFilterObj.contragentAddressWork := edtContragentAddressWork.Text; 



     ENContragentFilterObj.contragentPosition := edtContragentPosition.Text; 



     ENContragentFilterObj.contragentOkpo := edtContragentOkpo.Text; 



     ENContragentFilterObj.contragentBankAccount := edtContragentBankAccount.Text; 



     ENContragentFilterObj.contragentBankName := edtContragentBankName.Text; 



     ENContragentFilterObj.contragentBankMfo := edtContragentBankMfo.Text; 



     ENContragentFilterObj.contragentBossName := edtContragentBossName.Text; 



     ENContragentFilterObj.contragentPassport := edtContragentPassport.Text; 



     if edtwarrantDate.checked then
     begin 
       if ENContragentFilterObj.warrantDate = nil then
          ENContragentFilterObj.warrantDate := TXSDate.Create;
       ENContragentFilterObj.warrantDate.XSToNative(GetXSDate(edtwarrantDate.DateTime));
     end
     else
       ENContragentFilterObj.warrantDate := nil;



     ENContragentFilterObj.warrantNumber := edtWarrantNumber.Text; 



     ENContragentFilterObj.warrantFIO := edtWarrantFIO.Text; 



     ENContragentFilterObj.warrantPassport := edtWarrantPassport.Text; 



     ENContragentFilterObj.warrantAddress := edtWarrantAddress.Text; 




  end;
end;

procedure TfrmENContragentFilterEdit.spbENTechConditionsObjectsTechConObjectsClick(Sender : TObject);
var 
   frmENTechConditionsObjectsShow: TfrmENTechConditionsObjectsShow;
begin
   frmENTechConditionsObjectsShow:=TfrmENTechConditionsObjectsShow.Create(Application,fmNormal);
   try
      with frmENTechConditionsObjectsShow do
        if ShowModal = mrOk then
        begin
            try
               if ENContragentFilterObj.techConObjects = nil then ENContragentFilterObj.techConObjects := ENTechConditionsObjects.Create();
               ENContragentFilterObj.techConObjects.code := StrToInt(GetReturnValue(sgENTechConditionsObjects,0));
               edtENTechConditionsObjectsTechConObjectsName.Text:=GetReturnValue(sgENTechConditionsObjects,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENTechConditionsObjectsShow.Free;
   end;
end;


procedure TfrmENContragentFilterEdit.spbENBasisTypeBasisTypeClick(Sender : TObject);
//var
 //  frmENBasisTypeShow: TfrmENBasisTypeShow;
begin
//   frmENBasisTypeShow:=TfrmENBasisTypeShow.Create(Application,fmNormal);
//   try
//      with frmENBasisTypeShow do
//        if ShowModal = mrOk then
//        begin
//            try
//               if ENContragentFilterObj.basisType = nil then ENContragentFilterObj.basisType := ENBasisType.Create();
//               ENContragentFilterObj.basisType.code := StrToInt(GetReturnValue(sgENBasisType,0));
//               edtENBasisTypeBasisTypeName.Text:=GetReturnValue(sgENBasisType,1);
//            except
//               on EConvertError do Exit;
//            end;
//        end;
//   finally
//      frmENBasisTypeShow.Free;
//   end;
end;





end.