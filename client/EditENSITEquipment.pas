
unit EditENSITEquipment;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSITEquipmentController, AdvObj ;

type
  TfrmENSITEquipmentEdit = class(TDialogForm)
  

  HTTPRIOENSITEquipment: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    pgENSITEquipment: TPageControl;
    tbMain: TTabSheet;
    lblName: TLabel;
    lblSerialnumber: TLabel;
    lblSuppliername: TLabel;
    lblIsserver: TLabel;
    lblNum: TLabel;
    lblSupplierdate: TLabel;
    lblWarranty: TLabel;
    lblIsliquidation: TLabel;
    lblTechnum1: TLabel;
    lblLisencepack: TLabel;
    lblTechnum2: TLabel;
    lblBatch: TLabel;
    lblDescr: TLabel;
    lblLocation: TLabel;
    lblInstalldate: TLabel;
    lblInputdate: TLabel;
    lblCommentGen: TLabel;
    spbENSITEquipTypeObjectType: TSpeedButton;
    lblENSITEquipTypeObjectTypeName: TLabel;
    spbENElementElement: TSpeedButton;
    lblENElementElementName: TLabel;
    spbFINWorkerFinworker: TSpeedButton;
    lblFINWorkerFinworkerName: TLabel;
    edtName: TEdit;
    edtSerialnumber: TEdit;
    edtSuppliername: TEdit;
    edtIsserver: TEdit;
    edtNum: TEdit;
    edtSupplierdate: TDateTimePicker;
    edtWarranty: TEdit;
    edtIsliquidation: TEdit;
    edtTechnum1: TEdit;
    edtLisencepack: TEdit;
    edtTechnum2: TEdit;
    edtBatch: TEdit;
    edtDescr: TEdit;
    edtLocation: TEdit;
    edtInstalldate: TDateTimePicker;
    edtInputdate: TDateTimePicker;
    edtCommentGen: TMemo;
    edtENSITEquipTypeObjectTypeName: TEdit;
    edtENElementElementName: TEdit;
    edtFINWorkerFinworkerName: TEdit;
    tsDetails: TTabSheet;
    tbHistory: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sgENSITFeature: TAdvStringGrid;
    ImageList1: TImageList;
    HTTPRIOENSITFeature: THTTPRIO;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Label1: TLabel;
    edtEPRenName: TEdit;
    spbRen: TSpeedButton;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENSITEquipTypeObjectTypeClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);
  procedure spbFINWorkerFinworkerClick(Sender : TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure pgENSITEquipmentChange(Sender: TObject);
    procedure spbRenClick(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateGrid(Sender: TObject);

end;

var
  frmENSITEquipmentEdit: TfrmENSITEquipmentEdit;
  ENSITEquipmentObj: ENSITEquipment;
  //ENSITFeatureObj: ENSITFeature;

implementation

uses
  ShowENSITEquipType
  ,ENSITEquipTypeController
  ,ShowENElement
  ,ENElementController
  ,ShowFINWorker
  ,FINWorkerController
, ENSITFeatureController, ENSITEquipStateController, EditENSITFeature,ShowENEPRen,
  ShowENGeographicDepartment, ENGeographicDepartmentController, ENConsts;

{uses  
    EnergyproController, EnergyproController2, ENSITEquipmentController  ;
}
{$R *.dfm}

var
 ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSITFeatureHeaders: array [1..3] of String =
        ( 'Код'
          ,'Назва типу'
          ,'Значення'
        );
  featureFilter: ENSITFeatureFilter;

procedure TfrmENSITEquipmentEdit.FormShow(Sender: TObject);
var
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
  eList : ENElementShortList;
  TempENElement: ENElementControllerSoapPort;
  eFilter : ENElementFilter;
begin
  DisableControls([edtEPRenName, edtENSITEquipTypeObjectTypeName, edtFINWorkerFinworkerName , edtGeograph]);
  if  (DialogState = dsView) then
  begin
      DisableControls([btnGeograph , btnGeographClear ]);
  end;

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
      ,edtEPRenName
      ,edtENSITEquipTypeObjectTypeName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
   if ENSITEquipmentObj.element.geoDepartmentRef <> nil then
      if ENSITEquipmentObj.element.geoDepartmentRef.code <> LOW_INT then
       begin
              // geodept
            TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
          try
            ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENSITEquipmentObj.element.geoDepartmentRef.code );
            edtGeograph.Text := ENGeographicDepartmentObj.name;
          except
            on EConvertError do Exit;
          end;
       end;

    // renname
    if ENSITEquipmentObj.element <> nil then
           if (ENSITEquipmentObj.element.renRef <> nil ) then
         begin
          TempENElement :=  HTTPRIOENElement as ENElementControllerSoapPort;
           eFilter := ENElementFilter.Create;
           SetNullIntProps(eFilter);
           SetNullXSProps(eFilter);
           eFilter.code := ENSITEquipmentObj.element.code;
          eList := TempENElement.getScrollableFilteredList(eFilter,0,-1);
          edtEPRenName.Text :=  eList.list[0].renRefName;
         end
        else
          edtEPRenName.Text := ''
    else
       edtEPRenName.Text := '';



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
    MakeMultiline(edtCommentGen.Lines, ENSITEquipmentObj.commentGen);

    edtENSITEquipTypeObjectTypeName.Text := ENSITEquipmentObj.objectType.name;
    //edtEPRenName.Text := ENSITEquipmentObj.element.renRef.name;
    //edtENElementElementName.Text := ENSITEquipmentObj.element.name;
  if ENSITEquipmentObj.finworker <> nil then
    edtFINWorkerFinworkerName.Text := ENSITEquipmentObj.finworker.name;

  end;
end;



procedure TfrmENSITEquipmentEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSITEquipment: ENSITEquipmentControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtIsserver
      ,edtWarranty
      ,edtIsliquidation
      ,edtTechnum1
      ,edtTechnum2
      ,edtBatch
      ,edtEPRenName
      ,edtENSITEquipTypeObjectTypeName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSITEquipment := HTTPRIOENSITEquipment as ENSITEquipmentControllerSoapPort;


     ENSITEquipmentObj.name := edtName.Text; 

     ENSITEquipmentObj.serialnumber := edtSerialnumber.Text; 

     ENSITEquipmentObj.suppliername := edtSuppliername.Text; 

     if ( edtIsserver.Text <> '' ) then
       ENSITEquipmentObj.isserver := StrToInt(edtIsserver.Text)
     else
       ENSITEquipmentObj.isserver := Low(Integer) ;

     ENSITEquipmentObj.num := edtNum.Text; 

     if edtsupplierdate.checked then
     begin 
       if ENSITEquipmentObj.supplierdate = nil then
          ENSITEquipmentObj.supplierdate := TXSDate.Create;
       ENSITEquipmentObj.supplierdate.XSToNative(GetXSDate(edtsupplierdate.DateTime));
     end
     else
       ENSITEquipmentObj.supplierdate := nil;

     if ( edtWarranty.Text <> '' ) then
       ENSITEquipmentObj.warranty := StrToInt(edtWarranty.Text)
     else
       ENSITEquipmentObj.warranty := Low(Integer) ;

     if ( edtIsliquidation.Text <> '' ) then
       ENSITEquipmentObj.isliquidation := StrToInt(edtIsliquidation.Text)
     else
       ENSITEquipmentObj.isliquidation := Low(Integer) ;

     if ( edtTechnum1.Text <> '' ) then
       ENSITEquipmentObj.technum1 := StrToInt(edtTechnum1.Text)
     else
       ENSITEquipmentObj.technum1 := Low(Integer) ;

     ENSITEquipmentObj.lisencepack := edtLisencepack.Text; 

     if ( edtTechnum2.Text <> '' ) then
       ENSITEquipmentObj.technum2 := StrToInt(edtTechnum2.Text)
     else
       ENSITEquipmentObj.technum2 := Low(Integer) ;

     if ( edtBatch.Text <> '' ) then
       ENSITEquipmentObj.batch := StrToInt(edtBatch.Text)
     else
       ENSITEquipmentObj.batch := Low(Integer) ;

     ENSITEquipmentObj.descr := edtDescr.Text; 

     ENSITEquipmentObj.location := edtLocation.Text; 

     if edtinstalldate.checked then
     begin 
       if ENSITEquipmentObj.installdate = nil then
          ENSITEquipmentObj.installdate := TXSDate.Create;
       ENSITEquipmentObj.installdate.XSToNative(GetXSDate(edtinstalldate.DateTime));
     end
     else
       ENSITEquipmentObj.installdate := nil;

     if edtinputdate.checked then
     begin 
       if ENSITEquipmentObj.inputdate = nil then
          ENSITEquipmentObj.inputdate := TXSDate.Create;
       ENSITEquipmentObj.inputdate.XSToNative(GetXSDate(edtinputdate.DateTime));
     end
     else
       ENSITEquipmentObj.inputdate := nil;

     ENSITEquipmentObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENSITEquipmentObj.code:=low(Integer);
      TempENSITEquipment.add(ENSITEquipmentObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSITEquipment.save(ENSITEquipmentObj);
    end;
  end;
end;


procedure TfrmENSITEquipmentEdit.spbENSITEquipTypeObjectTypeClick(Sender : TObject);
var
   frmENSITEquipTypeShow: TfrmENSITEquipTypeShow;
begin
   frmENSITEquipTypeShow:=TfrmENSITEquipTypeShow.Create(Application,fmNormal);
   try
      with frmENSITEquipTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSITEquipmentObj.objectType = nil then ENSITEquipmentObj.objectType := ENSITEquipType.Create();
               ENSITEquipmentObj.objectType.code := StrToInt(GetReturnValue(sgENSITEquipType,0));
               edtENSITEquipTypeObjectTypeName.Text:=GetReturnValue(sgENSITEquipType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENSITEquipTypeShow.Free;
   end;
end;



procedure TfrmENSITEquipmentEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSITEquipmentObj.element = nil then ENSITEquipmentObj.element := ENElement.Create();
               ENSITEquipmentObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENSITEquipmentEdit.spbFINWorkerFinworkerClick(Sender : TObject);
var 
   frmFINWorkerShow: TfrmFINWorkerShow;
begin
   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal);
   try
      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSITEquipmentObj.finworker = nil then ENSITEquipmentObj.finworker := FINWorker.Create();
               ENSITEquipmentObj.finworker.code := StrToInt(GetReturnValue(sgFINWorker,0));
               edtFINWorkerFinworkerName.Text:=GetReturnValue(sgFINWorker,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;



procedure TfrmENSITEquipmentEdit.actViewExecute(Sender: TObject);
Var TempENSITFeature: ENSITFeatureControllerSoapPort;
begin
 TempENSITFeature := HTTPRIOENSITFeature as ENSITFeatureControllerSoapPort;
   try
     ENSITFeatureObj := TempENSITFeature.getObject(StrToInt(sgENSITFeature.Cells[0,sgENSITFeature.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSITFeatureEdit:=TfrmENSITFeatureEdit.Create(Application, dsView);
  try
    frmENSITFeatureEdit.ShowModal;
  finally
    frmENSITFeatureEdit.Free;
    frmENSITFeatureEdit:=nil;
  end;
end;

procedure TfrmENSITEquipmentEdit.btnGeographClearClick(Sender: TObject);
begin
   ENSITEquipmentObj.element.geoDepartmentRef.code := LOW_INT;
   edtGeograph.Text := '';

end;

procedure TfrmENSITEquipmentEdit.btnGeographClick(Sender: TObject);
var
   frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
   Filter : ENGeographicDepartmentFilter;
   selected : ENGeographicDepartmentShort;
begin
  Filter := ENGeographicDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);


  frmENGeographicDepartmentShow := TfrmENGeographicDepartmentShow.Create(Application, fmNormal, Filter);
  try
      with frmENGeographicDepartmentShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENGeographicDepartmentShort(sgENGeographicDepartment.Objects[0, sgENGeographicDepartment.Row]);
                except
                   on EConvertError do begin  Exit; end;
                end;
                 ENSITEquipmentObj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENSITEquipmentEdit.actInsertExecute(Sender: TObject);
Var TempENSITFeature: ENSITFeatureControllerSoapPort;
begin
  TempENSITFeature := HTTPRIOENSITFeature as ENSITFeatureControllerSoapPort;
  ENSITFeatureObj:=ENSITFeature.Create;



  try
    frmENSITFeatureEdit:=TfrmENSITFeatureEdit.Create(Application, dsInsert);
    try
      if frmENSITFeatureEdit.ShowModal = mrOk then
      begin
        if ENSITFeatureObj<>nil then
            //TempENSITFeature.add(ENSITFeatureObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSITFeatureEdit.Free;
      frmENSITFeatureEdit:=nil;
    end;
  finally
    ENSITFeatureObj.Free;
  end;
end;

procedure TfrmENSITEquipmentEdit.actDeleteExecute(Sender: TObject);
Var TempENSITFeature: ENSITFeatureControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSITFeature := HTTPRIOENSITFeature as ENSITFeatureControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSITFeature.Cells[0,sgENSITFeature.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Свойства) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSITFeature.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSITEquipmentEdit.actEditExecute(Sender: TObject);
Var TempENSITFeature: ENSITFeatureControllerSoapPort;
begin
 TempENSITFeature := HTTPRIOENSITFeature as ENSITFeatureControllerSoapPort;
   try
     ENSITFeatureObj := TempENSITFeature.getObject(StrToInt(sgENSITFeature.Cells[0,sgENSITFeature.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSITFeatureEdit:=TfrmENSITFeatureEdit.Create(Application, dsEdit);
  try
    if frmENSITFeatureEdit.ShowModal= mrOk then
      begin
        //TempENSITFeature.save(ENSITFeatureObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSITFeatureEdit.Free;
    frmENSITFeatureEdit:=nil;
  end;
end;

procedure TfrmENSITEquipmentEdit.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;

procedure TfrmENSITEquipmentEdit.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSITFeature.RowCount-1 do
   for j:=0 to sgENSITFeature.ColCount-1 do
     sgENSITFeature.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSITEquipmentEdit.pgENSITEquipmentChange(Sender: TObject);
var
TempENSITFeature: ENSITFeatureControllerSoapPort;
  i: Integer;
  ENSITFeatureList: ENSITFeatureShortList;
begin
  SetGridHeaders(ENSITFeatureHeaders, sgENSITFeature.ColumnHeaders);
  ColCount:=100;

if pgENSITEquipment.ActivePage = tsDetails then
 begin


  TempENSITFeature :=  HTTPRIOENSITFeature as ENSITFeatureControllerSoapPort;

  if featureFilter = nil then
  begin
     featureFilter := ENSITFeatureFilter.Create;
     SetNullIntProps(featureFilter);
     SetNullXSProps(featureFilter);
  end;
   featureFilter.conditionSQL:= ' EQUIPMENTCODE = ' +  IntToStr(ENSITEquipmentObj.code);
  ENSITFeatureList := TempENSITFeature.getScrollableFilteredList(ENSITFeatureFilter(featureFilter),0,ColCount);


  LastCount:=High(ENSITFeatureList.list);

  if LastCount > -1 then
     sgENSITFeature.RowCount:=LastCount+2
  else
     sgENSITFeature.RowCount:=2;

   with sgENSITFeature do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSITFeatureList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSITFeatureList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSITFeatureList.list[i].featureTypeName;
        Cells[2,i+1] := ENSITFeatureList.list[i].value;
        LastRow:=i+1;
        sgENSITFeature.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSITFeature.Row:=1;
 end;
 ///////////////////////////////////
end;


procedure TfrmENSITEquipmentEdit.spbRenClick(Sender: TObject);
var
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSITEquipmentObj.element = nil then ENSITEquipmentObj.element := ENElement.Create();
               if ENSITEquipmentObj.element.renRef = nil then ENSITEquipmentObj.element.renRef := EPRenRef.Create();
               ENSITEquipmentObj.element.renRef.code := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;


end.