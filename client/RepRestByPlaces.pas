unit RepRestByPlaces;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,DialogFormUnit , RQStorageZoneController;

type
  TfrmRepRestByPlaces = class(TDialogForm)
    lblcutDate: TLabel;
    edtcutDate: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    gbPlanMOL: TGroupBox;
    lblMolName: TLabel;
    spbPlanMOL: TSpeedButton;
    spbPlanMOLClear: TSpeedButton;
    edtMolName: TEdit;
    lblnnCode: TLabel;
    edtEdtnnCode: TEdit;
    lblRQStorageStorageName: TLabel;
    edtRQStorageStorageName: TEdit;
    spbRQStorageStorage: TSpeedButton;
    btnStorage: TSpeedButton;
    lblRQStorageZoneName: TLabel;
    edtRQStorageZoneName: TEdit;
    spbRQStorageZone: TSpeedButton;
    btnZoneClear: TSpeedButton;
    chkreportDetail: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbPlanMOLClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbRQStorageStorageClick(Sender: TObject);
    procedure spbPlanMOLClearClick(Sender: TObject);
    procedure btnStorageClick(Sender: TObject);
    procedure spbRQStorageZoneClick(Sender: TObject);
    procedure btnZoneClearClick(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
    divcode : string;
    divname : String;
    codedivforfilter : Integer;
    codeStorage : Integer;
  end;

var
  frmRepRestByPlaces: TfrmRepRestByPlaces;


implementation

uses
  EnergyproController, ShowENSpravMol, ChildFormUnit, DMReportsUnit, 
  FINMolController, ShowFINMol, EditRQStorage, ShowRQStorage , RQStorageController , 
  ShowENMol, ENMolController, ENConsts, ENMolTypeController, 
  ENMolStatusController, ShowRQStorageZone;

{$R *.dfm}

procedure TfrmRepRestByPlaces.FormCreate(Sender: TObject);
begin
     edtcutDate.Date := Date;
     divcode := '0';
     codedivforfilter := 0;
     codeStorage := 0;
end;

procedure TfrmRepRestByPlaces.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;

begin

    SetLength(argNames, 6);
    SetLength(args, 6);

    argNames[0] := 'cutDate';
    args[0] := DateToStr(edtcutDate.DateTime);

    argNames[1] := 'divcode';
    args[1] := divcode;

    argNames[2] := 'nn';
    if Trim(edtEdtnnCode.Text) <> '' then
    args[2] := edtEdtnnCode.Text
    else
    args[2] := '0';

    argNames[3] := 'storagename';
    if Trim(edtRQStorageStorageName.Text) = '' then
    args[3] := ' '
    else
    args[3] := Trim(edtRQStorageStorageName.Text);

    argNames[4] := 'storagezonename';
    if Trim(edtRQStorageZoneName.Text) = '' then
    args[4] := ' '
    else 
    args[4] := Trim(edtRQStorageZoneName.Text);

    argNames[5] := 'showDetailReport';
    if chkreportDetail.Checked then
        args[5] := '1'
    else
        args[5] := '0';



    reportName := 'material/materialsRemainder/materialsRemainder';
    makeReport(reportName, argNames, args, 'xls');
    
end;

procedure TfrmRepRestByPlaces.spbPlanMOLClick(Sender: TObject);
var
   frmENMolShow : TfrmENMolShow;
   molFilter : ENMolFilter;
begin

   molFilter := ENMolFilter.Create;
   SetNullIntProps(molFilter);
   SetNullXSProps(molFilter);
   molFilter.typeRef := ENMolTypeRef.Create;
   molFilter.typeRef.code := ENMOLTYPE_STOREKEEPER_CENTRAL;
   molFilter.statusRef := ENMolStatusRef.Create;
   molFilter.statusRef.code := ENMOLSTATUS_ACTIVE;

   frmENMolShow := TfrmENMolShow.Create(Application,fmNormal,molFilter);

   frmENMolShow.isStorage := True;

   try
      frmENMolShow.DisableActions([frmENMolShow.actInsert, frmENMolShow.actDelete, frmENMolShow.actEdit]);
      
      with frmENMolShow do
        if ShowModal = mrOk then
        begin
            try
               // edtMolCode.Text := GetReturnValue(sgENMol,1);
               edtMolName.Text := GetReturnValue(sgENMol,1) + ' ' + GetReturnValue(sgENMol,2);
               divcode := GetReturnValue(sgENMol,1);
               divname := GetReturnValue(sgENMol,2);
               // если код мола выбрали другой обнуляем выбранный ранее склад и место хранения 
               if  codedivforfilter <>  StrToInt(GetReturnValue(sgENMol,0)) then
                begin
                 edtRQStorageStorageName.Text := '';
                 codeStorage:= 0;
                 edtRQStorageZoneName.Text:= '';
                end;
                
               codedivforfilter := StrToInt(GetReturnValue(sgENMol,0));
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENMolShow.Free;
   end;
end;

procedure TfrmRepRestByPlaces.FormShow(Sender: TObject);
begin
  inherited;
   DisableControls( [edtMolName, edtRQStorageStorageName, edtRQStorageZoneName]);
end;

procedure TfrmRepRestByPlaces.spbRQStorageStorageClick(Sender: TObject);
var
   f : RQStorageFilter;
   frmRQStorageShow: TfrmRQStorageShow;
begin

     f := RQStorageFilter.Create;
     SetNullXSProps(f);
     SetNullIntProps(f);
     // если выбран МОЛ фильтруем склады к которым МОЛ имеет доступ 
     if codedivforfilter <> 0 then
     f.conditionSQL := ' rqstorage.code in ( select q.storagerefcode from rqstorage2enmol q where q.molrefcode = ' + IntToStr(codedivforfilter) + ' ) ';

   frmRQStorageShow:=TfrmRQStorageShow.Create(Application,fmNormal ,f );
   try
      with frmRQStorageShow do
        if ShowModal = mrOk then
        begin
            try
              // if RQStorageZoneObj.storage = nil then RQStorageZoneObj.storage := RQStorage.Create();
              // RQStorageZoneObj.storage.code := StrToInt(GetReturnValue(sgRQStorage,0));
               begin
                edtRQStorageStorageName.Text:=GetReturnValue(sgRQStorage,2);
                codeStorage := StrToInt(GetReturnValue(sgRQStorage,0));
               end;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQStorageShow.Free;
   end;
end;
procedure TfrmRepRestByPlaces.spbPlanMOLClearClick(Sender: TObject);
begin
  inherited;
    codedivforfilter := 0;
end;

procedure TfrmRepRestByPlaces.btnStorageClick(Sender: TObject);
begin
  inherited;
  edtRQStorageStorageName.Text := '';
  codeStorage:= 0;
  edtRQStorageZoneName.text := '';
end;

procedure TfrmRepRestByPlaces.spbRQStorageZoneClick(Sender: TObject);
var
   f : RQStorageZoneFilter;
   frmRQStorageZoneShow: TfrmRQStorageZoneShow;
begin

     f := RQStorageZoneFilter.Create;
     SetNullXSProps(f);
     SetNullIntProps(f);
     // если только выбран МОЛ - фильтруем места хранения по мол
     if ((codedivforfilter <> 0 )  and (codeStorage = 0 )) then
     f.conditionSQL := ' rqstoragezone.storagecode in ( select q.storagerefcode from rqstorage2enmol q where q.molrefcode = ' + IntToStr(codedivforfilter) + ' ) ';
     // если выбран склад - фильтруем по складу
     if ((codedivforfilter <> 0 )  and (codeStorage <> 0 )) then
     f.conditionSQL := ' rqstoragezone.storagecode = ' + IntToStr(codeStorage);


   frmRQStorageZoneShow:=TfrmRQStorageZoneShow.Create(Application,fmNormal ,f );
   try
      with frmRQStorageZoneShow do
        if ShowModal = mrOk then
        begin
            try
              // if RQStorageZoneObj.storage = nil then RQStorageZoneObj.storage := RQStorage.Create();
              // RQStorageZoneObj.storage.code := StrToInt(GetReturnValue(sgRQStorage,0));
               edtRQStorageZoneName.Text:=GetReturnValue(sgRQStorageZone,2);

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQStorageZoneShow.Free;
   end;
end;

procedure TfrmRepRestByPlaces.btnZoneClearClick(Sender: TObject);
begin
  inherited;
    edtRQStorageZoneName.text := '';
end;

end.
