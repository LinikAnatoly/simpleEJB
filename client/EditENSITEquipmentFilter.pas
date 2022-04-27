
unit EditENSITEquipmentFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSITEquipmentController ;

type
  TfrmENSITEquipmentFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblSerialnumber : TLabel;
    edtSerialnumber: TEdit;
    lblSuppliername : TLabel;
    edtSuppliername: TEdit;
    lblIsserver : TLabel;
    edtIsserver: TEdit;
    lblNum : TLabel;
    edtNum: TEdit;
    lblSupplierdate : TLabel;
    edtSupplierdate: TDateTimePicker;
    lblWarranty : TLabel;
    edtWarranty: TEdit;
    lblIsliquidation : TLabel;
    edtIsliquidation: TEdit;
    lblTechnum1 : TLabel;
    edtTechnum1: TEdit;
    lblLisencepack : TLabel;
    edtLisencepack: TEdit;
    lblTechnum2 : TLabel;
    edtTechnum2: TEdit;
    lblBatch : TLabel;
    edtBatch: TEdit;
    lblDescr : TLabel;
    edtDescr: TEdit;
    lblLocation : TLabel;
    edtLocation: TEdit;
    lblInstalldate : TLabel;
    edtInstalldate: TDateTimePicker;
    lblInputdate : TLabel;
    edtInputdate: TDateTimePicker;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

  lblENSITEquipTypeObjectTypeName : TLabel;
  edtENSITEquipTypeObjectTypeName : TEdit;
  spbENSITEquipTypeObjectType : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  
  lblFINWorkerFinworkerName : TLabel;
  edtFINWorkerFinworkerName : TEdit;
  spbFINWorkerFinworker : TSpeedButton;
  

  HTTPRIOENSITEquipment: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENSITEquipTypeObjectTypeClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);
  procedure spbFINWorkerFinworkerClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSITEquipmentFilterEdit: TfrmENSITEquipmentFilterEdit;
  ENSITEquipmentFilterObj: ENSITEquipmentFilter;

implementation

uses
  ShowENSITEquipType
  ,ENSITEquipTypeController
  ,ShowENElement
  ,ENElementController
  ,ShowFINWorker
  ,FINWorkerController
;

{uses  
    EnergyproController, EnergyproController2, ENSITEquipmentController  ;
}
{$R *.dfm}



procedure TfrmENSITEquipmentFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtIsserver
      ,edtWarranty
      ,edtIsliquidation
      ,edtTechnum1
      ,edtTechnum2
      ,edtBatch
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENSITEquipmentObj.name; 



    edtSerialnumber.Text := ENSITEquipmentObj.serialnumber; 



    edtSuppliername.Text := ENSITEquipmentObj.suppliername; 



    if ( ENSITEquipmentObj.isserver <> Low(Integer) ) then
       edtIsserver.Text := IntToStr(ENSITEquipmentObj.isserver)
    else
       edtIsserver.Text := '';



    edtNum.Text := ENSITEquipmentObj.num; 



      if ENSITEquipmentObj.supplierdate <> nil then
      begin
        edtSupplierdate.DateTime:=EncodeDate(ENSITEquipmentObj.supplierdate.Year,ENSITEquipmentObj.supplierdate.Month,ENSITEquipmentObj.supplierdate.Day);
        edtSupplierdate.checked := true;
      end
      else
      begin
        edtSupplierdate.DateTime:=SysUtils.Date;
        edtSupplierdate.checked := false;
      end;



    if ( ENSITEquipmentObj.warranty <> Low(Integer) ) then
       edtWarranty.Text := IntToStr(ENSITEquipmentObj.warranty)
    else
       edtWarranty.Text := '';



    if ( ENSITEquipmentObj.isliquidation <> Low(Integer) ) then
       edtIsliquidation.Text := IntToStr(ENSITEquipmentObj.isliquidation)
    else
       edtIsliquidation.Text := '';



    if ( ENSITEquipmentObj.technum1 <> Low(Integer) ) then
       edtTechnum1.Text := IntToStr(ENSITEquipmentObj.technum1)
    else
       edtTechnum1.Text := '';



    edtLisencepack.Text := ENSITEquipmentObj.lisencepack; 



    if ( ENSITEquipmentObj.technum2 <> Low(Integer) ) then
       edtTechnum2.Text := IntToStr(ENSITEquipmentObj.technum2)
    else
       edtTechnum2.Text := '';



    if ( ENSITEquipmentObj.batch <> Low(Integer) ) then
       edtBatch.Text := IntToStr(ENSITEquipmentObj.batch)
    else
       edtBatch.Text := '';



    edtDescr.Text := ENSITEquipmentObj.descr; 



    edtLocation.Text := ENSITEquipmentObj.location; 



      if ENSITEquipmentObj.installdate <> nil then
      begin
        edtInstalldate.DateTime:=EncodeDate(ENSITEquipmentObj.installdate.Year,ENSITEquipmentObj.installdate.Month,ENSITEquipmentObj.installdate.Day);
        edtInstalldate.checked := true;
      end
      else
      begin
        edtInstalldate.DateTime:=SysUtils.Date;
        edtInstalldate.checked := false;
      end;



      if ENSITEquipmentObj.inputdate <> nil then
      begin
        edtInputdate.DateTime:=EncodeDate(ENSITEquipmentObj.inputdate.Year,ENSITEquipmentObj.inputdate.Month,ENSITEquipmentObj.inputdate.Day);
        edtInputdate.checked := true;
      end
      else
      begin
        edtInputdate.DateTime:=SysUtils.Date;
        edtInputdate.checked := false;
      end;



    edtCommentGen.Text := ENSITEquipmentObj.commentGen; 


  end;

}

end;



procedure TfrmENSITEquipmentFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSITEquipment: ENSITEquipmentControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSITEquipmentFilterObj.name := edtName.Text; 



     ENSITEquipmentFilterObj.serialnumber := edtSerialnumber.Text; 



     ENSITEquipmentFilterObj.suppliername := edtSuppliername.Text; 



     if ( edtIsserver.Text <> '' ) then
       ENSITEquipmentFilterObj.isserver := StrToInt(edtIsserver.Text)
     else
       ENSITEquipmentFilterObj.isserver := Low(Integer) ;




     ENSITEquipmentFilterObj.num := edtNum.Text; 


      if edtsupplierdate.checked then
     begin
     if ENSITEquipmentFilterObj.supplierdate = nil then
        ENSITEquipmentFilterObj.supplierdate := TXSDate.Create;
      ENSITEquipmentFilterObj.supplierdate.XSToNative(GetXSDate(edtsupplierdate.DateTime));
     end
      else
       ENSITEquipmentFilterObj.supplierdate := nil;



     if ( edtWarranty.Text <> '' ) then
       ENSITEquipmentFilterObj.warranty := StrToInt(edtWarranty.Text)
     else
       ENSITEquipmentFilterObj.warranty := Low(Integer) ;




     if ( edtIsliquidation.Text <> '' ) then
       ENSITEquipmentFilterObj.isliquidation := StrToInt(edtIsliquidation.Text)
     else
       ENSITEquipmentFilterObj.isliquidation := Low(Integer) ;




     if ( edtTechnum1.Text <> '' ) then
       ENSITEquipmentFilterObj.technum1 := StrToInt(edtTechnum1.Text)
     else
       ENSITEquipmentFilterObj.technum1 := Low(Integer) ;




     ENSITEquipmentFilterObj.lisencepack := edtLisencepack.Text; 



     if ( edtTechnum2.Text <> '' ) then
       ENSITEquipmentFilterObj.technum2 := StrToInt(edtTechnum2.Text)
     else
       ENSITEquipmentFilterObj.technum2 := Low(Integer) ;




     if ( edtBatch.Text <> '' ) then
       ENSITEquipmentFilterObj.batch := StrToInt(edtBatch.Text)
     else
       ENSITEquipmentFilterObj.batch := Low(Integer) ;




     ENSITEquipmentFilterObj.descr := edtDescr.Text; 



     ENSITEquipmentFilterObj.location := edtLocation.Text; 


       if edtinstalldate.checked then
     begin
     if ENSITEquipmentFilterObj.installdate = nil then

        ENSITEquipmentFilterObj.installdate := TXSDate.Create;
      ENSITEquipmentFilterObj.installdate.XSToNative(GetXSDate(edtinstalldate.DateTime)) ;
      end
      else
       ENSITEquipmentFilterObj.installdate := nil;




        if edtinputdate.checked then
     begin
     if ENSITEquipmentFilterObj.inputdate = nil then
        ENSITEquipmentFilterObj.inputdate := TXSDate.Create;
      ENSITEquipmentFilterObj.inputdate.XSToNative(GetXSDate(edtinputdate.DateTime));
      end
      else
       ENSITEquipmentFilterObj.inputdate := nil;








     ENSITEquipmentFilterObj.commentGen := edtCommentGen.Text; 




  end;
end;

procedure TfrmENSITEquipmentFilterEdit.spbENSITEquipTypeObjectTypeClick(Sender : TObject);
var 
   frmENSITEquipTypeShow: TfrmENSITEquipTypeShow;
begin
   frmENSITEquipTypeShow:=TfrmENSITEquipTypeShow.Create(Application,fmNormal);
   try
      with frmENSITEquipTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSITEquipmentFilterObj.objectType = nil then ENSITEquipmentFilterObj.objectType := ENSITEquipType.Create();
               ENSITEquipmentFilterObj.objectType.code := StrToInt(GetReturnValue(sgENSITEquipType,0));
               edtENSITEquipTypeObjectTypeName.Text:=GetReturnValue(sgENSITEquipType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENSITEquipTypeShow.Free;
   end;
end;


procedure TfrmENSITEquipmentFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSITEquipmentFilterObj.element = nil then ENSITEquipmentFilterObj.element := ENElement.Create();
               ENSITEquipmentFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENSITEquipmentFilterEdit.spbFINWorkerFinworkerClick(Sender : TObject);
var 
   frmFINWorkerShow: TfrmFINWorkerShow;
begin
   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal);
   try
      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSITEquipmentFilterObj.finworker = nil then ENSITEquipmentFilterObj.finworker := FINWorker.Create();
               ENSITEquipmentFilterObj.finworker.code := StrToInt(GetReturnValue(sgFINWorker,0));
               edtFINWorkerFinworkerName.Text:=GetReturnValue(sgFINWorker,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;





end.